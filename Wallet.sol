pragma ton-solidity >= 0.35.0;

contract Wallet {

    modifier checkOwnerAndAccept {
        require(msg.pubkey() == tvm.pubkey(), 100);
		tvm.accept();
		_;
	}

    function sendTransactionNoCommis(address dest, uint128 value) public pure checkOwnerAndAccept {
        dest.transfer(value, true, 0);
    }

    function sendTransactionCommis(address dest, uint128 value) public pure checkOwnerAndAccept {
        dest.transfer(value, true, 1);
    }

    function sendTransactionAll(address dest) public pure checkOwnerAndAccept {
        dest.transfer(0, true, 32);
    }

}