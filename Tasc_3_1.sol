pragma ton-solidity >= 0.35.0;

contract Tasc_3_1 {
    string[] public data;

    function add_data(string name) public {
        data.push(name);
    }

    function del_data() public {
        for (uint i = 0; i < data.length - 1; i++) {
            data[i] = data[i+1];
        }
        data.pop();
    }
}

