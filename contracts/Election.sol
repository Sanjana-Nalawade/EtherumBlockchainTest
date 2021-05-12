pragma solidity ^0.4.2;

contract Election{
	//Model a condidate
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}

	//Store a candidates
	//Fetch candidate
	mapping(uint => Candidate) public candidates;
	//Store candidates Count
	uint public candidatesCount;

	function Election() public {
		addCandidate("Candidate 1");
		addCandidate("Candidate 2");
	}

	function addCandidate (string _name) private {
		candidatesCount ++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}
}