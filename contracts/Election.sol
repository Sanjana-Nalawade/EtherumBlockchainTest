pragma solidity ^0.4.2;

contract Election{
	//Model a condidate
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}

	//Store Accounts that have voted
	mapping(address => bool) public voters;
	//Store a candidates
	//Fetch candidate
	mapping(uint => Candidate) public candidates;

	//Store candidates Count
	uint public candidatesCount;
	
	//voted event

	event votedEvent(
		uint indexed _candidateId
	);


	function Election() public {
		addCandidate("Candidate 1");
		addCandidate("Candidate 2");
	}

	function addCandidate (string _name) private {
		candidatesCount ++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}

	function vote(uint _candidateId) public{
		//require that tehy have not voted before
		require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

		//record that voter has voted
		voters[msg.sender] = true;

		//update candidate votecount
		candidates[_candidateId].voteCount ++;

		emit votedEvent(_candidateId);
	}
}