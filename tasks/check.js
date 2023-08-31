task("check-contract", "to test the new funcitons")
    .addParam("contract", "The address of the check contract")
    .setAction(async (taskArgs) => {
        const contractAddr = taskArgs.contract
        const networkId = network.name
        console.log("running the contract on ", networkId)

        //create a new wallet instance
        const wallet = new ethers.Wallet(network.config.accounts[0], ethers.provider)

        //create a FilecoinMarketConsumer contract factory
        // const Check = await ethers.getContractFactory("Check", wallet)
        const Check = await ethers.getContractFactory("Check", wallet)

        //create a Check contract instance
        //this is what you will call to interact with the deployed contract
        const check = await Check.attach(contractAddr)

        //send a transaction to call fund() method
        // transaction = await check.fund(0, {
        //   value: ethers.utils.parseEther("0.1")
        // })
        // transaction.wait()
        // transaction = await check.getFilAddress("0x9299eac94952235Ae86b94122D2f7c77F7F6Ad30")
        // console.log(transaction.data.toString())
        // nextTransaction = await check.getEthAddress(transaction)
        // console.log(nextTransaction)
        // try {
        //     client = await check.checkAllFunctions("1")
        //     console.log(client)
        // } catch (error) {
        //     console.log(error.json)
        // }

        // console.log("client2")
        // client2 = await check.checkAllFunctions2()
        // console.log(client2)
        // console.log("client3")
        client3 = await check.getDealActivation("4000")
        console.log(client3)
        // console.log("balance")
        // balance = await check.balanceOf("0x9299eac94952235Ae86b94122D2f7c77F7F6Ad30")
        // console.log(balance)
        // tx = await client.wait(1)
        // console.log(client)
        // console.log(tx)
        // console.log(tx.logs[0].topics)
        // console.log(tx.events[0].args)
        // console.log(tx.events[0].topics)
        // console.log(tx.events[0].decode(tx.events[0].data, tx.events[0].topics))
        // console.log(tx.tostring())
        // console.log(tx.logsBloom.toString())
        console.log("Complete!")
    })
