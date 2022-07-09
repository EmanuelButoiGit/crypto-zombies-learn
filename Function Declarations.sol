function eatHamburgers(string memory _name, uint _amount) public {

}

/*This is a function named eatHamburgers that takes 2 parameters: a string and a uint. 
For now the body of the function is empty. Note that we're specifying the function visibility as public. 
We're also providing instructions about where the _name variable should be stored- in memory. 
This is required for all reference types such as arrays, structs, mappings, and strings*/

string greeting = "What's up dog";

function sayHello() public returns (string memory) {
  return greeting;
}

//So in this case we could declare it as a view function, meaning it's only viewing the data but not modifying it:

function sayHello() public view returns (string memory) { 
    
}

//Solidity also contains pure functions, which means you're not even accessing any data in the app. Consider the following:

function _multiply(uint a, uint b) private pure returns (uint) {
  return a * b;
}

//Note: It may be hard to remember when to mark functions as pure/view. 
//Luckily the Solidity compiler is good about issuing warnings to let you know when you should use one of these modifiers