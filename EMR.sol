pragma solidity ^0.4.19;

contract  EMR{

    struct Medi{
        string Mname;   //药品名称
        string Mtype;   //药品剂型
        int Mnum;   //药品剂量
        string Mdw; //剂量单位
        string Muse;    //使用方法
    }

    struct MR{
        string HostName;    //医院全称
        string PName;   //病人姓名
        string PSex;    //性别
        int PAge;   //年龄
        string Date;    //日期

        Medi[5] Med;    //药剂

        address DocSign;    //医生签名
        address MedSign;    //药剂师签名
        address PricSign;   //计价员签名

    }

    address private owner;
}
