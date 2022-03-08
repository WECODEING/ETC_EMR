var Web3 = require('web3');
var web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:7545'));

var fs = require('fs');
const { inherits } = require('util');
var EMRABI = JSON.parse(fs.readFileSync("E:\\web\\EMR.abi".toString()));
var EMRaddress = "0xC7b7fD99666d2A6c949006e1AbA41cA0aD0e2711";
var mycontract = new web3.eth.Contract(EMRABI,EMRaddress);


// mycontract.methods.Ownable().send({from: '0xe7Cd9e68DCCD5CA5bA2eC3f6F3422dF12c3225Dd'})
// .on('receipt',function(result){console.log(result)});

mycontract.methods.owner().call((err,result)=>{
console.log(result); });

// mycontract.methods.AddMed(ID,name,type,dw).send({from: '0xe7Cd9e68DCCD5CA5bA2eC3f6F3422dF12c3225Dd'})
// .on('receipt',function(result){console.log(result)});

// mycontract.methods.CheckMed(1001)
//     .call(function(error,result){
//         console.log(result);
//     });