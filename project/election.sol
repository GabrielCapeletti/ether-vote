a solidity ^0.4.11;

contract Election {

    address owner = msg.sender;
    mapping(address=>Elector) electors;
    uint128[] candidates;
    uint256 ballotIndex;
    
    struct Elector{
       uint256 ballotId;
       bool canVote;
    }
    
    constructor(uint totalCandidates) public{
        candidates = new uint128[](totalCandidates);
        ballotIndex = 1;
    }
    
     modifier canVote() {
        require(electors[msg.sender].canVote == true && electors[msg.sender].ballotId == 0);
        _;
    }
   
    modifier onlyOwner(address account) {
        assert(msg.sender == account);
        _;
    }
    
    function addElector(address id) public
    onlyOwner(owner){
       electors[id].canVote = true;
       electors[id].ballotId = 0;
    }
    
    function removeElector(address id) public
    onlyOwner(owner){
       electors[id].canVote = false;
    }
    
    function vote(uint candidateIndex) public
    canVote(){
        candidates[candidateIndex] ++;
        electors[msg.sender].ballotId = ballotIndex;
        ballotIndex++;
    }

}
