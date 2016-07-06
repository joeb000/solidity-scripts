# solidity-scripts
some basic solidity projects and shortcuts to getting up and running with smart contracts

This guide assumes you are using a mac with up to date OSX. If you are using linux, you'll have to modify some of the fully qualified file paths (replace `/Users/$USER` with `/home/$USER` on ubuntu). If you are using windows, god help you.

Make sure you have git cli installed. If you aren't sure, run `which git` in a terminal.

Run the following to create a directory to work out of:

    mkdir /Users/$USER/Desktop/IDEO
    mkdir /Users/$USER/Desktop/IDEO/datadir
    cd /Users/$USER/Desktop/IDEO
    git clone https://github.com/joeb000/solidity-scripts.git
    

# Setting up private ethereum blockchain sandbox

install geth (see instructions at: https://github.com/ethereum/go-ethereum/wiki/Building-Ethereum)
test that it works:

    which geth
    

Create a geth account in the newly created datadir (no need for a super secure password, its just a test environment sandbox and you may end up wanting to hardcode your pw in scripts in the future for simplicities sake)

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

# Compiling/Deploying your first smart contract

First unlock your coinbase account

Either:

    personal.unlockAccount(eth.coinbase);

Or to unlock for 2 hours (I usually prefer this route since its just a private sandbox):

    personal.unlockAccount(eth.coinbase,"password",7200);

I've taken care of compiling the solidity code and adding the javascript command for deploying it in the ./javascript/deployGlockchain.js
Copy the code from ./javascript/deployGlockchain.js and paste it into the console to deploy your contract. alternatively you could use the built in loadScript() function and pass in the fully qualified path to the js file as a string (e.g. `loadScript('/Users/joe/Desktop/IDEO/solidity-scripts/GunFun/javascript/deployGlockchain.js')`)

If you want to manually compile your solidity code then you should either download the solc binary or learn how to use the online compiler: https://ethereum.github.io/browser-solidity/#version=soljson-latest.js

If you ran my js deploy script, the contract instance should be assigned to a var called myContract - test this out by running:

     myContract

If you got a bunch of json data then congrats it worked and your contract was successfully deployed and assigned.
