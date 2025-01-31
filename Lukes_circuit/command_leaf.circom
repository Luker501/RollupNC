include "../circomlib/circuits/mimc.circom";

template CommandLeaf() {

    signal input leaf_x; //position x on Merkle Tree
    signal input leaf_y; //position y on Merkle Tree
    signal input action_or_change; //is the sender recording an action (True) or changing the public key (false)
    signal input detail; //either the action detail or the new private key **NEEDS run time check?

    signal output out;

    component txLeaf = MultiMiMC7(6,91);
    txLeaf.in[0] <== leaf_x;
    txLeaf.in[1] <== leaf_y;
    txLeaf.in[2] <== action_or_change;
    txLeaf.in[3] <== detail;

    out <== txLeaf.out;
}
