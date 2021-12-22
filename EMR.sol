pragma solidity ^0.4.19;


contract Ownable {
    
    address public owner;
  
    mapping(address=>bool)Manager;
  
    //@owner
    function Ownable() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) onlyOwner {
        if (newOwner != address(0)) {
        owner = newOwner;
    }
}
  
  
  //@manager
  function AddMag(address _new)onlyOwner{
        Manager[_new]=true;
    }
    
    function DelMag(address _del)onlyOwner{
        Manager[_del]=false;
    }
    
    function CheakMag(address _mag) return bool public{
        return Doctors[_mag];
    }

    modifier onlyMag(){
        require(CheakMag(message.sender));
        _;
    }
  

}



contract  EMR{


    struct Med{
        string Mname;   //药品名称
        string Mtype;   //药品剂型
        string Mdw; //剂量单位
    }

    struct MR{
        string HostName;    //医院全称
        string PName;   //病人姓名
        string PSex;    //性别
        int PAge;   //年龄
        string Date;    //日期

        MedID[5] Med;    //药剂
        int[5]nums;     //药品剂量
        string[5] Muse; //using function

        address DocSign;    //医生签名
        address MedSign;    //药剂师签名
        address PricSign;   //计价员签名
    }

    mapping(uint=>Med)medicine; //MedID药品ID 药品唯一标识药品
    mapping(uint=>MR)medrepic;  //MRid处方ID唯一标识一张处方
    
    //管理人员添加药品
    function AddMed(uint medid,string mname,string mtype,string mdw) onlyMag {
        //
    }
    //管理人员移除药品
    function RmMed(uint medid)onlyMag{
        //
    }
    
}


contract Patient{

    event chetMR(address _own,uint _MRid){
        //;
    }




}

contract Doctor{

    mapping(address=>bool)Doctors;
    
    function AddDoc(address _new)onlyOwner{
        Doctors[_new]=true;
    }
    
    function DelDoc(address _del)onlyOwner{
        Doctors[_del]=false;
    }
    
    function CheakDoc(address _doc) return bool public{
        return Doctors[_doc];
    }

    modifier onlyDoc(){
        require(CheakDoc(message.sender));
        _;
    }


    //只有医生能创建处方
    function createMR(address _own,uint _patientid) modifier onlyDoc{
        //;
    }

    //医生提交处方
    function commitMR(uint _MRid)modifier onlyDoc{
        //
    }
}
