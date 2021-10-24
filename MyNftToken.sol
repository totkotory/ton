pragma ton-solidity >= 0.35.0;

contract MyNftToken {
    struct Token {
        string name;
        uint8 health; 
        uint8 speed;
        uint8 jump_height;
        uint8 jump_distance;
        uint price;   
    }
    Token[] tokensArr;
    mapping (uint=>uint) tokenToOwner;

    modifier checkOwnerAndAccept {
        require(msg.pubkey() == tvm.pubkey(), 100);
		tvm.accept();
		_;
	}
    
    function createToken(string name, uint8 health, uint8 speed, uint8 jump_height, uint8 jump_distance, uint price) public {
        bool flag = true;
        for (uint256 i = 0; i < tokensArr.length; i++) {
            if (tokensArr[i].name == name) {
                flag = false;
                break;
            }
        }
        require(flag, 200, "this name is already present");
        tvm.accept();
        tokensArr.push(Token(name, health, speed, jump_height, jump_distance, price));
        uint keyAsLastNum = tokensArr.length - 1;
        tokenToOwner[msg.pubkey()] = keyAsLastNum;
    }


    function changePrice(uint tokenId, uint pubKeyNewOwner) public {
        require(msg.pubkey() == tokenToOwner[tokenId], 101);
        tvm.accept();
        tokenToOwner[tokenId] = pubKeyNewOwner;
    }
   
   function changePower(uint newPrice) public checkOwnerAndAccept{
        tokensArr[tokenToOwner[msg.pubkey()]].price = newPrice;
    }

}