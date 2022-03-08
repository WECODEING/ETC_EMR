
var mycontract;

window.addEventListener('load',function()
{
    if (typeof window.ethereum !== 'undefined'){
        //使用MetaMask的提供者
        web3 = new Web3(window.ethereum);
        console.log('MetaMask is installed!');
        console.log("1");
    }else{
        web3= new Web3(new Web3.providers.HttpProvider("HTTP://127.0.0.1:7545"));
        console.log("2");
    }

    // if (typeof web3 !== 'undefined') {
    //     web3 = new Web3(web3.currentProvider);
    // } else {
    //     //连接到Ganache
    //     web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:7545'));
    // }

    var EMRABI = [
        {
            "constant": false,
            "inputs": [
                {
                    "name": "_del",
                    "type": "address"
                }
            ],
            "name": "DelDoc",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "_del",
                    "type": "address"
                }
            ],
            "name": "DelMag",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [
                {
                    "name": "_pha",
                    "type": "address"
                }
            ],
            "name": "CheakPha",
            "outputs": [
                {
                    "name": "",
                    "type": "bool"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "hostname",
                    "type": "string"
                },
                {
                    "name": "patientid",
                    "type": "address"
                },
                {
                    "name": "caseid",
                    "type": "uint256"
                },
                {
                    "name": "speciality",
                    "type": "string"
                },
                {
                    "name": "diagnosis",
                    "type": "string"
                }
            ],
            "name": "createMR",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "_new",
                    "type": "address"
                }
            ],
            "name": "AddDoc",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "MRid",
                    "type": "uint256"
                }
            ],
            "name": "Prescribe",
            "outputs": [
                {
                    "name": "",
                    "type": "string"
                },
                {
                    "name": "",
                    "type": "string"
                },
                {
                    "name": "",
                    "type": "string"
                }
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [],
            "name": "CheckMRbook",
            "outputs": [
                {
                    "name": "",
                    "type": "uint256[]"
                }
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "medid1",
                    "type": "uint256"
                },
                {
                    "name": "nums1",
                    "type": "string"
                },
                {
                    "name": "muse1",
                    "type": "string"
                },
                {
                    "name": "medid2",
                    "type": "uint256"
                },
                {
                    "name": "nums2",
                    "type": "string"
                },
                {
                    "name": "muse2",
                    "type": "string"
                },
                {
                    "name": "medid3",
                    "type": "uint256"
                },
                {
                    "name": "nums3",
                    "type": "string"
                },
                {
                    "name": "muse3",
                    "type": "string"
                },
                {
                    "name": "medid4",
                    "type": "uint256"
                },
                {
                    "name": "nums4",
                    "type": "string"
                },
                {
                    "name": "muse4",
                    "type": "string"
                },
                {
                    "name": "medid5",
                    "type": "uint256"
                },
                {
                    "name": "nums5",
                    "type": "string"
                },
                {
                    "name": "muse5",
                    "type": "string"
                }
            ],
            "name": "addmedMR",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [],
            "name": "Ownable",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [],
            "name": "owner",
            "outputs": [
                {
                    "name": "",
                    "type": "address"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "_new",
                    "type": "address"
                }
            ],
            "name": "AddPha",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [
                {
                    "name": "_MRid",
                    "type": "uint256"
                },
                {
                    "name": "code",
                    "type": "uint256"
                },
                {
                    "name": "num",
                    "type": "uint256"
                }
            ],
            "name": "CheckMRbody",
            "outputs": [
                {
                    "name": "",
                    "type": "string"
                },
                {
                    "name": "",
                    "type": "string"
                },
                {
                    "name": "",
                    "type": "string"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [
                {
                    "name": "_MRid",
                    "type": "uint256"
                },
                {
                    "name": "code",
                    "type": "uint256"
                }
            ],
            "name": "CheckMRtitle",
            "outputs": [
                {
                    "name": "",
                    "type": "string"
                },
                {
                    "name": "",
                    "type": "address"
                },
                {
                    "name": "",
                    "type": "uint256"
                },
                {
                    "name": "",
                    "type": "string"
                },
                {
                    "name": "",
                    "type": "string"
                },
                {
                    "name": "",
                    "type": "uint256"
                },
                {
                    "name": "",
                    "type": "address"
                },
                {
                    "name": "",
                    "type": "address"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "medid",
                    "type": "uint256"
                }
            ],
            "name": "RmMed",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "_mag",
                    "type": "address"
                }
            ],
            "name": "CheakMag",
            "outputs": [
                {
                    "name": "",
                    "type": "bool"
                }
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [
                {
                    "name": "medid",
                    "type": "uint256"
                }
            ],
            "name": "CheckMed",
            "outputs": [
                {
                    "name": "",
                    "type": "string"
                },
                {
                    "name": "",
                    "type": "string"
                },
                {
                    "name": "",
                    "type": "string"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "_new",
                    "type": "address"
                }
            ],
            "name": "AddMag",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [
                {
                    "name": "_doc",
                    "type": "address"
                }
            ],
            "name": "CheckDoc",
            "outputs": [
                {
                    "name": "",
                    "type": "bool"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "mrid",
                    "type": "uint256"
                },
                {
                    "name": "paddress",
                    "type": "address"
                }
            ],
            "name": "commitMR",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "medid",
                    "type": "uint256"
                },
                {
                    "name": "mname",
                    "type": "string"
                },
                {
                    "name": "mtype",
                    "type": "string"
                },
                {
                    "name": "mdw",
                    "type": "string"
                }
            ],
            "name": "AddMed",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [],
            "name": "Setauthorcode",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "newOwner",
                    "type": "address"
                }
            ],
            "name": "transferOwnership",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "_del",
                    "type": "address"
                }
            ],
            "name": "DelPha",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        }
    ];

    var EMRaddress = "0x596e959D55eb57F823CcAeEe59Fa12f3E3cfF009";
    mycontract = new web3.eth.Contract(EMRABI,EMRaddress);
    // web3.eth.defaultAccount = web3.eth.accounts[0]; //设置默认调用账户
})


async function getAccount() {
    // const showAccount = document.querySelector('.showAccount');//绑定showAccount
    const accounts = await ethereum.request({ method: 'eth_requestAccounts' });

    //console.log(accounts);
    const account = accounts[0];
    // showAccount.innerHTML = account;
    //如果用户同意了登录请求，你就可以拿到用户的账号
    web3.eth.defaultAccount = accounts[0];
    // console.log(web3.eth.defaultAccount);
    temp=account.substr(0,15);
    document.getElementById("loginaddress").innerHTML=temp+"……";
    console.log(temp);
}


function puts(logs)
{
    document.getElementById("log").innerHTML=logs;
}


function setown()
{
    mycontract.methods.Ownable().send({from:web3.eth.defaultAccount})
    .on('receipt',function(result){console.log(result)});
}

function showown()
{
    puts("正在查询超级管理员……");
    mycontract.methods.owner().call((error,result)=>{
        $("#manager").html(result); });
}


function addDoctor()
{
    mycontract.methods.AddDoc(web3.utils.toHex($("#indocaddress").val())).send({from:web3.eth.defaultAccount})
    .on('receipt',function(result){console.log(result)});
}

function checkDoctor()
{
    mycontract.methods.CheckDoc(web3.utils.toHex($("#indocaddress").val()))
    .call(function(error,result){
        if(result==true)puts("是医师");
        else puts("不是医师");
    });
}

function addPharm()
{
    mycontract.methods.AddPha(web3.utils.toHex($("#indocaddress").val())).send({from:web3.eth.defaultAccount})
    .on('receipt',function(result){console.log(result)});
}

function checkPharm()
{
    mycontract.methods.CheckPha(web3.utils.toHex($("#indocaddress").val()))
    .call(function(error,result){
        console.log(result);
    });
}



function addmed()
{
    mycontract.methods.AddMed($("#ipmid").val(),$("#ipmname").val(),$("#ipmtype").val(),$("#ipmdw").val()).send({from:web3.eth.defaultAccount})
    .on('receipt',function(result){document.getElementById("log").innerHTML="添加成功";});
}

function checkmed()
{
    document.getElementById("mid").innerHTML=$("#medid").val();
    puts("正在查询药品信息……");
    //web3js.utils.toHex(ID)
    mycontract.methods.CheckMed($("#medid").val())
    .call(function(error,result){
        $("#mname").html(result[0]);
        $("#mtype").html(result[1]);
        $("#mdw").html(result[2]);
    });
}


// 核心代码，将秒数转换成常用时间表示
function converTimeOfHMS(date) {
  var json_date = new Date(date).toJSON();
  return new Date(new Date(json_date) + 8 * 3600 * 1000)
    .toISOString()
    .replace(/T/g, " ")
    .replace(/\.[\d]{3}Z/, "");
}

function checkMR()
{
    
    puts("正在查询药品信息……");
    mycontract.methods.CheckMRtitle($("#EMRID").val(),$("#AUTHORcode").val())
    .call(function(error,result){
        $("#hostname").html(result[0]);
        var temp=result[1].substr(0,12);
        $("#patientname").html(temp+"……");
        $("#caseid").html(result[2]);
        $("#speciality").html(result[3]);
        $("#diagnosis").html(result[4]);
        $("#date").html(converTimeOfHMS(result[5]*1000));
        temp=result[6].substr(0,12);
        $("#docSign").html(temp+"……");
        temp=result[7].substr(0,12);
        $("#pharmSign").html(temp+"……");
    });

    mycontract.methods.CheckMRbody($("#EMRID").val(),$("#AUTHORcode").val(),0)
    .call(function(error,result){
        $("#medname"+"1").html(result[0]);
        $("#mednums"+"1").html(result[1]);
        $("#meduse"+"1").html(result[2]);
    });
    mycontract.methods.CheckMRbody($("#EMRID").val(),$("#AUTHORcode").val(),1)
    .call(function(error,result){
        $("#medname"+"2").html(result[0]);
        $("#mednums"+"2").html(result[1]);
        $("#meduse"+"2").html(result[2]);
    });
    mycontract.methods.CheckMRbody($("#EMRID").val(),$("#AUTHORcode").val(),2)
    .call(function(error,result){
        $("#medname"+"3").html(result[0]);
        $("#mednums"+"3").html(result[1]);
        $("#meduse"+"3").html(result[2]);
    });
    mycontract.methods.CheckMRbody($("#EMRID").val(),$("#AUTHORcode").val(),3)
    .call(function(error,result){
        $("#medname"+"4").html(result[0]);
        $("#mednums"+"4").html(result[1]);
        $("#meduse"+"4").html(result[2]);
    });
    mycontract.methods.CheckMRbody($("#EMRID").val(),$("#AUTHORcode").val(),4)
    .call(function(error,result){
        $("#medname"+"5").html(result[0]);
        $("#mednums"+"5").html(result[1]);
        $("#meduse"+"5").html(result[2]);
    });
}


//创建处方
function createMR()
{
    
    mycontract.methods.createMR($("#inhostname").val(),web3.utils.toHex($("#inpatientname").val()),
    $("#incaseid").val(),$("#inspeciality").val(),$("#indiagnosis").val()).send({from:web3.eth.defaultAccount})
    .on('receipt',function(result){console.log(result);});

    console.log("title finish!");

    mycontract.methods.addmedMR(0,$("#inmedname1").val(),$("#inmednums1").val(),$("#inmeduse1").val())
    .send({from:web3.eth.defaultAccount})
    .on('receipt',function(result){console.log(result);});

    mycontract.methods.addmedMR(1,$("#inmedname2").val(),$("#inmednums2").val(),$("#inmeduse2").val())
    .send({from:web3.eth.defaultAccount})
    .on('receipt',function(result){console.log(result);});

    mycontract.methods.addmedMR(2,$("#inmedname3").val(),$("#inmednums3").val(),$("#inmeduse3").val())
    .send({from:web3.eth.defaultAccount})
    .on('receipt',function(result){console.log(result);});

    mycontract.methods.addmedMR(3,$("#inmedname4").val(),$("#inmednums4").val(),$("#inmeduse4").val())
    .send({from:web3.eth.defaultAccount})
    .on('receipt',function(result){console.log(result);});

    mycontract.methods.addmedMR(4,$("#inmedname5").val(),$("#inmednums5").val(),$("#inmeduse5").val())
    .send({from:web3.eth.defaultAccount})
    .on('receipt',function(result){console.log(result);});

    console.log("body finish!");

    mycontract.methods.commitMR($("#inEMRID").val(),$("#inpatientname").val())
    .send({from:web3.eth.defaultAccount})
    .on('receipt',function(result){console.log(result);});

    console.log("commit success!");
}