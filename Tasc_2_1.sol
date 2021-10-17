pragma ton-solidity >= 0.35.0;

contract Tasc_2_1 {
    uint a = 1;

    function mult(uint8 x) public view returns (uint){
        require(x >= 1 && x <= 10, 100, "expected >=0 and <=10");
        return a*x;
    }
}
