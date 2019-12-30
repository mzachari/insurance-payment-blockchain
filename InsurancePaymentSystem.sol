pragma solidity >=0.4.25 <0.6.0;

contract InsurancePaymentSystem
{
    //Set of States
    enum StateType { InsuranceOpted, PaymentComplete, PlanExpired}
    StateType public  State;
    address public Owner;
    address public _Farmer;
    int public  param1;
    int public  param2;
    int public _premiumPercent;
    int public _insuredAmt;
    string public _insPlanNo;
    string public _farmId;
    int public _minPrecipitationRate;
    int public _maxPrecipitationRate;
    int public _amountPaidOut;
    int public _currPrecipitationRate;
    string public _cropName;
    //enum CropNameEnum {Rice, Cotton, Wheat, Tea} CropNameEnum public CropName;

    constructor (address owner,
    address Farmer,
    int premiumPercent,
    int insuredAmt,
    string memory insPlanNo,
    string memory farmId,
    string memory cropName,
    int minPrecipitationRate,
    int maxPrecipitationRate
 ) public {
       State = StateType.InsuranceOpted;
       Owner = owner;
       _Farmer = Farmer;
       _premiumPercent = premiumPercent;
       _insuredAmt = insuredAmt;
       _insPlanNo = insPlanNo;
       _farmId = farmId;
       _minPrecipitationRate = minPrecipitationRate;
       _maxPrecipitationRate = maxPrecipitationRate;
       _cropName = cropName;
    }

    function CalculateAmount(int weatherCondition, bool expired) public {
        if(expired) {
            State = StateType.PlanExpired;
            return;
        }
        if(weatherCondition == 0){
                _amountPaidOut = _insuredAmt/2;
        }
        else{
            _amountPaidOut = _insuredAmt;
        }
        State = StateType.PaymentComplete;
    }
}
