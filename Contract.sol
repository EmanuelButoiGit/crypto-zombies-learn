pragma solidity >=0.5.0 <0.6.0; //1. Enter solidity version here

contract HelloWorld {// 2. Create contract here

event NewZombie(uint zombieId, string name, uint dna); //event for frontend

// State variables are permanently stored in contract storage. 
// This means they're written to the Ethereum blockchain. Think of them like writing to a DB.

uint dnaDigits = 16;// alias for uint256
uint dnaModulus = 10 ** dnaDigits;

struct Zombie {
    string name;
    uint dna;
}    

//You can declare an array as public, and Solidity will automatically create a getter method for it.

Zombie[] public zombies;

/*
Well, there are two ways in which you can pass an argument to a Solidity function:

By value, which means that the Solidity compiler creates a new copy of the parameter's value and passes 
it to your function. This allows your function to modify the value without worrying that the value 
of the initial parameter gets changed.

By reference, which means that your function is called with a... reference to the original variable. 
Thus, if your function changes the value of the variable it receives, the value of the original variable gets changed.
*/

function _createZombie(string memory _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        emit NewZombie(id, _name, _dna);
}

// And as with function parameters, it's convention to start private function names with an underscore (_).

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str))); // hash function
        return rand % dnaModulus;
    }

        function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }


}