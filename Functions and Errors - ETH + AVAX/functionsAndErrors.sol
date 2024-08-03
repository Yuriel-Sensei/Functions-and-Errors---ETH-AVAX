// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ErrorHandling {

    uint public value1 = 10;
    uint public value2 = 20;

    // Function using require() for input validation
    function setValue1(uint newValue) public {
        require(newValue > 0, "New value must be greater than zero");
        value1 = newValue;
    }

    // Function using assert() to check internal consistency
    function addValues() public view returns (uint) {
        assert(value1 + value2 == 30); // This should always hold true
        uint sum = value1 + value2;
        return sum;
    }

    // Function using revert() to handle unexpected conditions
    function divideByZero() public view {
        require(value2 > 0, "Cannot divide by zero"); // Use require for anticipated errors

        // uint result = value1 / value2;  // This line would cause a division by zero error in older Solidity versions
        revert("Unexpected division by zero"); // Explicitly revert to avoid undefined behavior
    }
}
