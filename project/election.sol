a solidity ^0.4.11; solidity ^0.4.11; solidity ^0.4.11;

contract Election {

    address owner = msg.sender;
    mapping(address=>Elector) electors;
    address firstElector;
    address lastElector;
    uint128[] candidates;
    uint256 ballotIndex;
    
    struct Elector{
        address nextElector;
        uint256 ballotId;
        bool canVote;
    }
    
    constructor(uint totalCandidates) public{
        lastElector = 0;
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
        electors[id].nextElector = 0;
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
        
        if(firstElector == 0){
            firstElector = msg.sender;
        }
        
        if(lastElector == 0){
            lastElector = msg.sender;
        }else{
            electors[lastElector].nextElector = msg.sender;
        }
    }
    
    function getWinner() public view returns(uint)
    {
        uint winnerIndex = 0;
        uint totalVotes = 0;
        for(uint candidateIndex = 0; candidateIndex < candidates.length; candidateIndex++)
           if(totalVotes < candidates[candidateIndex]){
                winnerIndex = candidateIndex;
                totalVotes = candidates[candidateIndex];
            }
            
        return winnerIndex;
    }
    
    function bulletinBoard() public view returns (address[] result) 
    {
        result = new address[](ballotIndex+1);
        address nextElector = firstElector;
        uint i = 0;
        while(nextElector != 0){
            result[i] =  nextElector;
            nextElector = electors[nextElector].nextElector;
        }
        return result;
    }
    
}
pragma experimental ABIEncoderV2;

contract Election {

    address owner = msg.sender;
    mapping(address=>Elector) electors;
    address firstElector;
    address lastElector;
    uint128[] candidates;
    uint256 ballotIndex;
    
    struct Elector{
        address nextElector;
        uint256 ballotId;
        bool canVote;
    }
    
    constructor(uint totalCandidates) public{
        lastElector = 0;
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
        electors[id].nextElector = 0;
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
        
        if(firstElector == 0){
            firstElector = msg.sender;
        }
        
        if(lastElector == 0){
            lastElector = msg.sender;
        }else{
            electors[lastElector].nextElector = msg.sender;
        }
    }
    
    function getWinner() public view returns(uint)
    {
        uint winnerIndex = 0;
        uint totalVotes = 0;
        for(uint candidateIndex = 0; candidateIndex < candidates.length; candidateIndex++)
           if(totalVotes < candidates[candidateIndex]){
                winnerIndex = candidateIndex;
                totalVotes = candidates[candidateIndex];
            }
            
        return winnerIndex;
    }
    
    function bulletinBoard() public view returns (Elector[] result) 
    {
        result = new Elector[](ballotIndex+1);
        address nextElector = firstElector;
        uint i = 0;
        while(nextElector != 0){
            result[i] =  electors[nextElector];
            nextElector = electors[nextElector].nextElector;
        }
        return result;
    }
    
}

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
