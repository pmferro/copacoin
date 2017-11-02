pragma solidity ^0.4.4;

library Utils {
    
    function stringsEqual(string _a, string _b) public pure returns (bool) {
		bytes32 hashA = keccak256(_a);
		bytes32 hashB = keccak256(_b);
		return hashA == hashB;
	}
	
	function bytes32ToString(bytes32 x) public pure returns (string) {
        bytes memory bytesString = new bytes(32);
        uint charCount = 0;
        for (uint j = 0; j < 32; j++) {
            byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
            if (char != 0) {
                bytesString[charCount] = char;
                charCount++;
            }
        }
        bytes memory bytesStringTrimmed = new bytes(charCount);
        for (j = 0; j < charCount; j++) {
            bytesStringTrimmed[j] = bytesString[j];
        }
        return string(bytesStringTrimmed);
    }
    
}