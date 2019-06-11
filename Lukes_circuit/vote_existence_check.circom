include "./balance_leaf.circom";
include "./leaf_existence.circom";

template VoteExistence(k){

    signal input x;
    signal input y;
    signal input private_key;
    signal input vote;

    signal input vote_root;
    signal input paths2_root_pos[k];
    signal input paths2_root[k];

    component voteLeaf = VoteLeaf();
    voteLeaf.x <== x;
    voteLeaf.y <== y;
    voteLeaf.private_key <== private_key;
    voteLeaf.vote <== vote; 

    component voteExistence = LeafExistence(k);
    voteExistence.leaf <== voteLeaf.out;
    voteExistence.root <== vote_root;

    for (var s = 0; s < k; s++){
        voteExistence.paths2_root_pos[s] <== paths2_root_pos[s];
        voteExistence.paths2_root[s] <== paths2_root[s];
    }


}
