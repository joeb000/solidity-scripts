# solidity-scripts
some basic solidity projects and shortcuts to getting up and running with smart contracts


install geth (see instructions at: https://github.com/ethereum/go-ethereum/wiki/Building-Ethereum)
test that it works:

    which geth

Run the following to create a directory to work out of:

    mkdir /Users/$USER/Desktop/IDEO
    mkdir /Users/$USER/Desktop/IDEO/datadir
    

Create a geth account in the newly created datadir

    geth --datadir /Users/$USER/Desktop/IDEO/datadir account new

copy address and insert it instead of \<address\> in the below command (also feel free to change the "YourName" to your name)

    geth  --identity  "YourName_node" --datadir /Users/$USER/Desktop/IDEO/datadir --autodag --networkid 1001 --mine --minerthreads=1 --etherbase "0x<address>" --rpc --rpccorsdomain="http://localhost:3000" --genesis /Users/$USER/Desktop/IDEO/GunFun/genesis.json


after a little automatic setup, it should start mining...

in a new terminal (leave geth running)

     geth attach ipc:/Users/$USER/Desktop/IDEO/datadir/geth.ipc

You can now run javascript functions against your geth node.
Some fun things to try...

    eth.accounts;
    personal.unlock(eth.accounts[0]);
    admin.nodeInfo;
    eth.blockNumber;
    personal.newAccount();
    web3.fromWei(eth.getBalance(eth.coinbase))
    eth.getBlock('latest');

For more info on the JS Console: https://github.com/ethereum/go-ethereum/wiki/JavaScript-Console
