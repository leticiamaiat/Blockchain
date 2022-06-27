pragma solidity >=0.5.0 <0.6.0; // version

contract Voting {
  
  mapping (bytes32 => uint) public votesReceived;
  
  //Uses an array of bytes32 instead of array of strings to store the list of candidates  
  bytes32[] public candidateList;

  //This is the constructor which will be called when contract is deployed
   function Voting(bytes32[] candidateNames) {
    candidateList = candidateNames;
  }

  // This function returns the total votes a candidate has received
  function totalVotesFor(bytes32 candidate) returns (uint8) {
    if (validCandidate(candidate) == false) throw;
    return votesReceived[candidate];
  }

  // This function increments the vote count for the specified candidate.
  function voteForCandidate(bytes32 candidate) {
    if (validCandidate(candidate) == false) throw;
    votesReceived[candidate] += 1;
  }

  function validCandidate(bytes32 candidate) returns (bool) {
    for(uint i = 0; i < candidateList.length; i++) {
      if (candidateList[i] == candidate) {
        return true;
      }
    }
    return false;
  }
}
