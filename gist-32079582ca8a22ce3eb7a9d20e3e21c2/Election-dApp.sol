
//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7; 
 
contract Election { 
    // Model a Candidate 
    struct Candidate { 
        uint id; 
        string name; 
        uint voteCount; 
    } 
   // constructor(){
     // addCandidate("Candidate1");
    //  addCandidate("Candidate2");
     // addCandidate("Candidate3");
    //  addCandidate("Candidate4");    }
 
    // Store accounts that have voted 
    mapping(address => bool) public voters; 
    // Store Candidates 
    // Fetch Candidate 
    mapping(uint => Candidate) public candidates; 
    // Store Candidates Count 
    uint public candidatesCount; 
 
    // voted event 
    event votedEvent ( 
        uint indexed _candidateId 
    ); 
 
    constructor () {
   addCandidate("Candidate1");
      addCandidate("Candidate2");
      addCandidate("Candidate3");
      addCandidate("Candidate4");} 
 
    function addCandidate (string memory _name) private { 
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    } 
 
    function vote (uint  _candidateId) public { 
        // require that they haven't voted before 
        require(!voters[msg.sender]);
 
        // require a valid candidate 
    require(_candidateId > 0 && _candidateId <= candidatesCount);

 
        // record that voter has voted 
        voters[msg.sender] = true;
         
 
        // update candidate vote Count
        candidates[_candidateId].voteCount ++;


 
        // trigger voted event 
       emit votedEvent(_candidateId); 
    } 
} 
