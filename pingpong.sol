pragma solidity ^0.4.24;

import "./ownable.sol" ;

contract PingPong is Ownable{
    
    
    struct Game{
        uint potValue;
    }
    
    Game[] public game; 

    mapping (uint => address) public gameToChallenger;
    
    function challenge() public payable {
        uint id = game.push(Game(msg.value))-1;
        gameToChallenger[id] = msg.sender;
    }
    
    
    function accept(uint _id) public payable {
        require(game[_id].potValue == msg.value);
        require(gameToChallenger[_id] == msg.sender);
        
    }
    
    
    function withdraw() external  onlyOwner {
        owner.transfer(address(this).balance);
    }
}
