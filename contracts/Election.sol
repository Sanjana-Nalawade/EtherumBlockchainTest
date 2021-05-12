pragma solidity ^0.4.2;

contract Election{
	//Store candidate
	//Read Candidate
	string public candidate;
	//Constuctor
	function Election() public {
		candidate = "Candidate 1";
	}

}