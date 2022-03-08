pragma solidity ^0.4.19;


contract ElectronicMedical {
    
    address public owner;
  
    mapping(address=>bool)Manager;
    
    // event test(int indexed n,string str);
    // function attach() public
    // {
    //     test(1,"hello");
    //     test(2,"word!");
    // }

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
        uint CaseID; //门诊病历号
        string Speciality;  //科室名称
        //string PSex;    //性别
        //int PAge;   //年龄
        string Diagnosis;   //诊断
        uint Date;    //日期

        uint[5] Medids;    //药剂
        string[5] Nums;     //药品剂量
        string[5] Muse; //使用医嘱

        address DocSign;    //医生签名
        address PharmSign;    //药剂师签名
    }

    mapping(uint=>Med)medicine; //MedID药品ID 药品唯一标识药品

    mapping(uint=>MR)medrepic;  //MRid处方ID唯一标识一张处方

    mapping(address=>uint[])mrbook;   //患者处方簿

    mapping(address=>uint)authorcode;  //患者授权码

    mapping(address=>MR)tempmr;   //医生处方草稿
    


    // Patient病人
    //patient has he's own mrbook where keep their medrepicid
    //using the MRid patient can check their own MR


    //患者生成授权码
    function Setauthorcode() public {
        authorcode[msg.sender]=123456;
    }

    //查看出示电子处方标题信息
    function CheckMRtitle(uint _MRid,uint code) public view 
    returns(string,address,uint,string,string,uint,address,address){
        MR memory mr = medrepic[_MRid];
        require((mr.PName == msg.sender) || (code == authorcode[mr.PName]),"access denials!");
        require(sha256(abi.encodePacked(medrepic[_MRid].HostName))!=sha256(abi.encodePacked("")),"your searching obj is not exit!");
        /*return mr; //返回电子处方信息
        string HostName;    //医院全称
        address PName;   //病人姓名
        int CaseID; //门诊病历号
        string Speciality;  //科室名称
        string Diagnosis;   //诊断
        uint Date;    //日期
        */
        return (mr.HostName,mr.PName,mr.CaseID,mr.Speciality,mr.Diagnosis,mr.Date,mr.DocSign,mr.PharmSign);
    }

    //查看出示电子处方主体信息
    function CheckMRbody(uint _MRid,uint code,uint num) public view 
    returns(string,string,string){
        MR memory mr = medrepic[_MRid];
        require((mr.PName == msg.sender) || (code == authorcode[mr.PName]),"access denials!");
        require(sha256(abi.encodePacked(medrepic[_MRid].HostName))!=sha256(abi.encodePacked("")),"your searching obj is not exit!");
        require(num<5,"num is overflow!");
        /*return mr;
        int[5] Mmedids;    //药剂
        string[5] Nums;     //药品剂量
        string[5] Muse; //使用医嘱
        */
        string rtname;
        if(mr.Medids[num]==0)return(" "," "," ");
        return (medicine[mr.Medids[num]].Mname,mr.Nums[num],mr.Muse[num]);
    }

    //查看电子处方簿
    function CheckMRbook() public view returns(uint[]){
        uint[] memory books = mrbook[msg.sender];
        
        return books;
    }



    //Pharm药剂师

    mapping(address=>bool)Pharms;
    
    function AddPha(address _new) onlyOwner{
        Pharms[_new]=true;
    }
    
    function DelPha(address _del) onlyOwner{
        Pharms[_del]=false;
    }
    
    function CheakPha(address _pha) public view returns(bool) {
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
    function CheckMed(uint medid) public view returns(string,string,string){
        require(CheakPha(msg.sender) || msg.sender == owner);
        Med memory tmp = medicine[medid];
        return (tmp.Mname,tmp.Mtype,tmp.Mdw);
    }

    //根据病人处方开药并签名
    function Prescribe(uint MRid) returns(string,string,string){
        MR storage med = medrepic[MRid];

        require(CheakPha(msg.sender) || msg.sender == owner);
        med.PharmSign=msg.sender;
    }



    //Doctor医生

    mapping(address=>bool)Doctors;
    
    function AddDoc(address _new)onlyOwner{
        Doctors[_new]=true;
    }
    
    function DelDoc(address _del)onlyOwner{
        Doctors[_del]=false;
    }
    
    function CheckDoc(address _doc) public view returns(bool){
        return Doctors[_doc];
    }

    modifier onlyDoc(){
        require(CheckDoc(msg.sender));
        _;
    }


    //医生编辑处方基本信息草稿
    function createMR(string hostname,address patientid,uint caseid,
                    string speciality,string diagnosis,uint mrid) {
        require(CheckDoc(msg.sender) || owner==msg.sender);

        require(sha256(abi.encodePacked(medrepic[mrid].HostName))==sha256(abi.encodePacked("")),"MR is exited!");

        /*
        string HostName;    //医院全称
        address PName;   //病人姓名
        int CaseID; //门诊病历号
        string Speciality;  //科室名称
        string Diagnosis;   //诊断
        uint Date;    //日期
        */
        tempmr[msg.sender].HostName=hostname;

        tempmr[msg.sender].PName=patientid;

        tempmr[msg.sender].CaseID=caseid;

        tempmr[msg.sender].Speciality=speciality;

        tempmr[msg.sender].Diagnosis=diagnosis;

        tempmr[msg.sender].DocSign=msg.sender;

        tempmr[msg.sender].Date=now;

        medrepic[mrid]=tempmr[msg.sender];

        mrbook[patientid].push(mrid);

    }

    //医生添加草稿处方药剂
    function addmedMR(uint medid1,string nums1,string muse1,uint medid2,string nums2,string muse2,
                    uint medid3,string nums3,string muse3,uint medid4,string nums4,string muse4,
                    uint medid5,string nums5,string muse5) {
        //
        require(CheckDoc(msg.sender) || owner==msg.sender);

        tempmr[msg.sender].Medids[0]=medid1;
        tempmr[msg.sender].Nums[0]=nums1;
        tempmr[msg.sender].Muse[0]=muse1;

        tempmr[msg.sender].Medids[1]=medid2;
        tempmr[msg.sender].Nums[1]=nums2;
        tempmr[msg.sender].Muse[1]=muse2;

        tempmr[msg.sender].Medids[2]=medid3;
        tempmr[msg.sender].Nums[2]=nums3;
        tempmr[msg.sender].Muse[2]=muse3;

        tempmr[msg.sender].Medids[3]=medid4;
        tempmr[msg.sender].Nums[3]=nums4;
        tempmr[msg.sender].Muse[3]=muse4;

        tempmr[msg.sender].Medids[4]=medid5;
        tempmr[msg.sender].Nums[4]=nums5;
        tempmr[msg.sender].Muse[4]=muse5;

    }

    //医生审核确认添加处方
    function commitMR(uint mrid,address paddress) {
        //
        require(CheckDoc(msg.sender) || owner==msg.sender);

        require(sha256(abi.encodePacked(medrepic[mrid].HostName))==sha256(abi.encodePacked("")),"MR is exited!");

        tempmr[msg.sender].DocSign=msg.sender;

        tempmr[msg.sender].Date=now;

        medrepic[mrid]=tempmr[msg.sender];

        mrbook[paddress].push(mrid);

    }
}

