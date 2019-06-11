include "./tx_leaf.circom";
include "./leaf_existence.circom";
include "../circomlib/circuits/eddsamimc.circom";

template CommandExistence(k){

    signal input sender_x;	//sender is from x leaf position
    signal input sender_y;	//sender is from y leaf position
    signal input action_or_change;	
    signal input detail;

    signal input command_root;
    signal input paths2_root_pos[k];
    signal input paths2_root[k];

    signal input R8x;	//related to signature
    signal input R8y;	//related to signature
    signal input S;	//?

    component commandLeaf = CommandLeaf();
    commandLeaf.sender_x <== sender_x;
    comandLeaf.sender_y <== sender_y;
    txLeaf.action_or_change <== action_or_change;
    txLeaf.detail <== detail;

    component commandExistence = CommandExistence(k);
    commandExistence.leaf <== commandLeaf.out;
    commandExistence.root <== command_root;

    for (var q = 0; q < k; q++){
        commandExistence.paths2_root_pos[q] <== paths2_root_pos[q];
        commandExistence.paths2_root[q] <== paths2_root[q];
    }

    component verifier = EdDSAMiMCVerifier();   
    verifier.enabled <== 1;
    verifier.Ax <== sender_x;
    verifier.Ay <== sender_y;
    verifier.R8x <== R8x;
    verifier.R8y <== R8y;
    verifier.S <== S;
    verifier.M <== txLeaf.out;

}

