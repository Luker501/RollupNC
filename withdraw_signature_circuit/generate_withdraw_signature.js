const eddsa = require("../circomlib/src/eddsa.js");
const snarkjs = require("snarkjs");
const fs = require("fs");
const bigInt = snarkjs.bigInt;


var prvKey = Buffer.from("2".padStart(64,'0'), "hex");

var pubKey = eddsa.prv2pub(prvKey);

var m = bigInt('0xC33Bdb8051D6d2002c0D80A1Dd23A1c9d9FC26E4');
var signature = eddsa.signMiMC(prvKey, m);

var verify = eddsa.verifyMiMC(m, signature, pubKey)
console.log(verify)

const inputs = {
    Ax: pubKey[0].toString(),
    Ay: pubKey[1].toString(),
    R8x: signature.R8[0].toString(),
    R8y: signature.R8[1].toString(),
    S: signature.S.toString(),
    ethRecipientAddress: m.toString()
}

fs.writeFileSync(
    "./input.json",
    JSON.stringify(inputs),
    "utf-8"
);
