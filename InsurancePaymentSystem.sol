pragma solidity >=0.4.25 <0.6.0;

contract InsurancePaymentSystem
{
    //Set of States
    enum StateType { InsuranceOpted, PayoutTriggered, ValidClaim, PaymentComplete, InvalidClaim}
    StateType public  State;
    address public Owner;
    address public _Farmer;
    int public  param1;
    int public  param2;
    string public _InsStartDate; //Need to check type for date fields
    string public _InsEndDate;
    int public _premiumPercent;
    int public _insuredAmt;
    string public _insPlanNo;
    string public _farmName;
    string public _farmId;
    string public _cultStartDate;
    string public _cultEndDate;
    int[] public _farmCoords; //Need to check
    int public _minPrecipitationRate;
    int public _maxPrecipitationRate;
    int public _amountPaidOut;
    int public _currPrecipitationRate;

    constructor (address owner,
    address Farmer,
    int premiumPercent,
    int insuredAmt,
    string memory insPlanNo,
    string memory farmName,
    string memory farmId,
    int minPrecipitationRate,
    int maxPrecipitationRate
 ) public {
       State = StateType.InsuranceOpted;
       Owner = owner;
       _Farmer = Farmer;
       _premiumPercent = premiumPercent;
       _insuredAmt = insuredAmt;
       _insPlanNo = insPlanNo;
       _farmName = farmName;
       _farmId = farmId;
       _minPrecipitationRate = minPrecipitationRate;
       _maxPrecipitationRate = maxPrecipitationRate;
    }
    function TriggerPayout(int precipitationRate) public {
        _currPrecipitationRate = precipitationRate;
        State = StateType.PayoutTriggered;
    }
    function CheckClaimValidity() public {
        if(_currPrecipitationRate >= _minPrecipitationRate || _currPrecipitationRate <= _maxPrecipitationRate) {
            State = StateType.InvalidClaim;
            revert("Invalid Claim");
        }
        else {
            State = StateType.ValidClaim;
        }
    }
    function CalculateAmount() public {
        _amountPaidOut = _insuredAmt * 8 / 100;
        State = StateType.PaymentComplete;
    }
    function Get_farmCoords() public view returns (int[] memory) {
     return _farmCoords;
}
}
