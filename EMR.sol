pragma solidity ^0.4.19;


contract ElectronicMedical {
    
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
    
    function CheakMag(address _mag) public returns(bool){
        return Manager[_mag];
    }

    modifier onlyMag(){
        require(CheakMag(msg.sender));
        _;
    }



    //EMR医疗处方


    struct Med{
        string Mname;   //药品名称
        string Mtype;   //药品剂型
        string Mdw; //剂量单位
    }

    struct MR{
        string HostName;    //医院全称
        address PName;   //病人姓名
        //string PSex;    //性别
        //int PAge;   //年龄
        //string Date;    //日期

        int[5] med;    //药剂
        int[5] nums;     //药品剂量
        string[5] Muse; //使用医嘱

        address DocSign;    //医生签名
        address PharmSign;    //药剂师签名
        mapping(uint=>bool)author;  //授权信息
    }

    mapping(uint=>Med)medicine; //MedID药品ID 药品唯一标识药品
    mapping(uint=>MR)medrepic;  //MRid处方ID唯一标识一张处方
    
    
    // Patient病人

    //查看电子处方
    function checkMR(,uint _MRid) public {
        Med med = medicine[_MRid];
        require(med.PName == msg.sender );
        return med; //返回电子处方信息
    }

    //出示电子处方
    function checkMR(uint _MRid，address pha) public {
        Med med = medicine[_MRidc];
        require(med.PName == msg.sender );
        med.author[pha]=true;
    }



    //Pharm药剂师

    mapping(address=>bool)Pharms;
    
    function AddPha(address _new) onlyOwner{
        Pharms[_new]=true;
    }
    
    function DelPha(address _del) onlyOwner{
        Pharms[_del]=false;
    }
    
    function CheakPha(address _pha) public  returns(bool) {
        return Pharms[_pha];
    }

    modifier onlyPha(){
        require(CheakPha(msg.sender));
        _;
    }


   //药剂师添加药品
    function AddMed(uint medid,string mname,string mtype,string mdw) {
        require(CheakPha(msg.sender) || msg.sender == owner);
        medicine[medid] = Med(mname,mtype,mdw);
    }

    //药剂师移除药品
    function RmMed(uint medid){
        require(CheakPha(msg.sender) || msg.sender == owner);
    }

    //药剂师查看药品
    function CheckMed(uint medid) returns(string,string,string){
        require(CheakPha(msg.sender) || msg.sender == owner);
        Med tmp = medicine[medid];
        return (tmp.Mname,tmp.Mtype,tmp.Mdw);
    }

    //根据病人处方开药并签名
    function Prescribe(uint _MRid) returns(string,string,string){
        Med med = medicine[_MRid];
        require(med.author[msg.sender] == true );
        require(CheakPha(msg.sender) || msg.sender == owner);
        med.PharmSign=msg.dender;
    }

    //Doctor医生

    mapping(address=>bool)Doctors;
    
    function AddDoc(address _new)onlyOwner{
        Doctors[_new]=true;
    }
    
    function DelDoc(address _del)onlyOwner{
        Doctors[_del]=false;
    }
    
    function CheakDoc(address _doc) public returns(bool){
        return Doctors[_doc];
    }

    modifier onlyDoc(){
        require(CheakDoc(msg.sender));
        _;
    }


    //只有医生能开具处方
    function createMR(string _hostpitalname,uint _patientid,
    int medid1=0,int num1=0,string muse1="",
    int medid2=0,int num2=0,string muse2="",
    int medid3=0,int num3=0,string muse3="",
    int medid4=0,int num4=0,string muse4="",
    int medid5=0,int num5=0,string muse5=""
    ) onlyDoc{
        //;
        Med med;
        med.HostName=_hostpitalname;
        med.PName=_patientid;
        for(i=0;i<5;i++)
        {
            
        }
    }

    //医生提交处方
    function commitMR(uint _MRid) onlyDoc{
        //
    }
}
