// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import Ownable contract from OpenZeppelin
import "@openzeppelin/contracts/access/Ownable.sol";

contract Election is Ownable {
    struct Candidate {
        string name;
        uint index;
        uint votecount;
    }

    struct Voter {
        string name;
        uint index;
        bool voted;
    }

    mapping(uint => Candidate) public candidates;
    mapping(uint => Voter) public voters;

    constructor() {
        // Add two candidates' information in the mapping using the constructor
        candidates[1] = Candidate("Rahul", 1, 0);
        candidates[2] = Candidate("Priya", 2, 0);
    }

    function vote(string memory voterName, uint candidateIndex) public {
        // Check if the voter has already voted
        require(!voters[candidateIndex].voted, "You have already voted.");

        // Save the voter's information in the mapping
        uint voterIndex = uint(keccak256(abi.encodePacked(voterName)));
        voters[voterIndex] = Voter(voterName, voterIndex, true);

        // Increment the vote count of the selected candidate
        candidates[candidateIndex].votecount++;
    }

    function getwinner() public view onlyOwner returns (uint) {
        // Determine the winner based on the vote count
        uint winningVoteCount = 0;
        uint winningCandidateIndex;

        for (uint i = 1; i <= 2; i++) {
            if (candidates[i].votecount > winningVoteCount) {
                winningVoteCount = candidates[i].votecount;
                winningCandidateIndex = i;
            }
        }

        return winningCandidateIndex;
    }
}