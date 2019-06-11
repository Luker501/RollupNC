include "../circomlib/circuits/mimc.circom";

template VoteLeaf() {

    signal input x;	//position x on the vote merkle tree
    signal input y;	//position y on the vote merkle tree
    signal input private_key;	//private key 
    signal input vote;		//vote 

    signal output out;

    component balanceLeaf = MultiMiMC7(5,91);
    balanceLeaf.in[0] <== x;
    balanceLeaf.in[1] <== y;
    balanceLeaf.in[2] <== private_key;
    balanceLeaf.in[3] <== vote; 

    out <== balanceLeaf.out;
}
