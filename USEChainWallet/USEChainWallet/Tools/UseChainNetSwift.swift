//
//  UseChainNetSwift.swift
//  UseChain
//
//  Created by Jacob on 2019/2/28.
//  Copyright © 2019 Jacob. All rights reserved.
//
import UIKit

var nonce: Int?
class UseChainNetSwift: NSObject {
    
}
extension UseChainNetSwift {

    @objc class func getCurrentBlockNum(resource: @escaping (_ content:Any?, _ error:NSError?) ->()) {
        let parameters: [String: Any] = ["jsonrpc": "2.0", "method": "eth_blockNumber", "params": [], "id": 83]
        UseWalletNetworkTools.sharedETH().request("POST", urlString: "", parameters: parameters) { (result, error) in
            if error != nil {
                resource(nil, error! as NSError)
            } else {
                resource(result, nil)
            }
        }
    }
    //etherscan
    @objc class func getTransactionByHash(hash: NSString, resource: @escaping (_ content:Any?, _ error:NSError?) ->()) {
        let parameters: [String: Any] = ["jsonrpc": "2.0", "method": "eth_getTransactionByHash", "params": [hash], "id": 1]
        UseWalletNetworkTools.sharedETH().request("POST", urlString: "", parameters: parameters) { (result, error) in
            if error != nil {
                resource(nil, error! as NSError)
            } else {
                resource(result, nil)
            }
        }
    }
    //ethplorer
    @objc class func getTransactionFromEthploreByTxHash(hash: String, resource: @escaping (_ content:Any?, _ error:NSError?) ->()) {
        //https://api.ethplorer.io/getTxInfo/0x81442b9142f357245974d226c092b2862d9257f0e131884597e90cb395e169c6?apiKey=freekey
        let parameters: [String: Any] = ["apiKey": "freekey"]
        UseWalletNetworkTools.sharedEthplorer().request("GET", urlString: "getTxInfo/" + hash, parameters: parameters) { (result, error) in
            if error != nil {
                resource(nil, error! as NSError)
            } else {
                resource(result, nil)
            }
        }
    }
    
    @objc class func getCopycatBalanceWith(copyCatCoinType: NSString, address: NSString, resource: @escaping (_ content:Any?, _ error:NSError?) ->()) {
        var dataStr = ""
        let tempAddress = address.replacingCharacters(in: NSRange(location: 0, length: 2), with: "")
        dataStr = "0x70a08231000000000000000000000000" + tempAddress
        var copyCatAddress = UserDefaults.standard.value(forKey: copyCatCoinType as String)
        print(copyCatAddress!)
        copyCatAddress = "0x64340ed116881e2b435b7240b3a60cf224630e01"
        let parameters: [String: Any] = ["jsonrpc": "2.0", "method": "eth_call", "params": [["to": copyCatAddress, "from": address, "data": dataStr],"latest"], "id": 1]
        UseWalletNetworkTools.sharedETH().request("POST", urlString: "", parameters: parameters) { (result, error) in
            if error != nil {
                resource(nil, error! as NSError)
            } else {
                resource(result, nil)
            }
        }
    }
    @objc class func getCopycatBalanceWith(copyCatAddress: NSString, address: NSString, resource: @escaping (_ content:Any?, _ error:NSError?) ->()) {
        var dataStr = ""
        let tempAddress = address.replacingCharacters(in: NSRange(location: 0, length: 2), with: "")
        dataStr = "0x70a08231000000000000000000000000" + tempAddress
        let parameters: [String: Any] = ["jsonrpc": "2.0", "method": "eth_call", "params": [["to": copyCatAddress, "from": address, "data": dataStr],"latest"], "id": 1]
        UseWalletNetworkTools.sharedETH().request("POST", urlString: "", parameters: parameters) { (result, error) in
            if error != nil {
                resource(nil, error! as NSError)
            } else {
                resource(result, nil)
            }
        }
    }
    
    @objc class func registeEOSPubKey(publicKey: String, address: NSString,  resource: @escaping (_ content:Any?, _ error:NSError?) ->()) {
        //let tempAddress = address.replacingCharacters(in: NSRange(location: 0, length: 2), with: "")
        let dataStr = "0xf2c298be00000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000035" + publicKey + "0000000000000000000000"
        let eosContractAddress = "0xd0a6E6C54DbC68Db5db3A091B171A77407Ff7ccf"
        let parameters: [String: Any] = ["jsonrpc": "2.0", "method": "eth_call", "params": [["to": eosContractAddress, "from": address, "data": dataStr],"latest"], "id": 1]
        UseWalletNetworkTools.sharedETH().request("POST", urlString: "", parameters: parameters) { (result, error) in
            if error != nil {
                resource(nil, error! as NSError)
            } else {
                resource(result, nil)
            }
        }
    }
    
    @objc class func getAltcoinBalanceWith(contractAddress: NSString, address: NSString, resource: @escaping (_ content:Any?, _ error:NSError?) ->()) {
        //https://api.etherscan.io/api?module=account&action=tokenbalance&contractaddress=0x64340ed116881E2b435b7240b3A60cF224630E01&address=0x7C8848c5019f2e4Ce7049F707E70341f90ea62e7&tag=latest&apikey=YourApiKeyToken
        let parameters: [String: Any] = ["module": "account", "action": "tokenbalance", "contractAddress": contractAddress, "address": address, "tag": "latest", "apiKey": "freeKey"]
        UseWalletNetworkTools.sharedEtherscan().request("GET", urlString: "", parameters: parameters) { (result, error) in
            if error != nil {
                resource(nil, error! as NSError)
            } else {
                resource(result, nil)
            }
        }
        
    }
    
    
    
    @objc class func getBalance(address: String, resource: @escaping (_ result:Any?, _ error:NSError?)->()) -> () {
        let parameters: [String: Any] = ["jsonrpc": "2.0", "method": "eth_getBalance", "params": [address,"latest"], "id": 1]
        UseWalletNetworkTools.sharedETH().request("POST", urlString: "", parameters: parameters) { (result, error) in
            if error != nil {
                resource(nil, error! as NSError)
            } else {
                resource(result, nil)
            }
        }
    }
    @objc class func getNonceWith(address: String, resource: @escaping (_ content:Any?, _ error:NSError?) ->()){
        let parameters: [String: Any] = ["jsonrpc": "2.0", "method": "eth_getTransactionCount", "params": [address,"latest"], "id": 1]
        UseWalletNetworkTools.sharedETH().request("POST", urlString: "", parameters: parameters) { (result, error) in
            if error != nil {
                resource(nil, error! as NSError)
            } else {
                let amount = (result as! [String: Any])["result"]
                resource(amount , nil)
            }
        }
    }
    @objc class func getEstimateGas(ToAddress: String, resource: @escaping (_ content:Any?, _ error:NSError?) ->()) {
        let parameters: [String: Any] = ["jsonrpc": "2.0", "method": "eth_estimateGas", "params": [["to": ToAddress]], "id": 6]
        UseWalletNetworkTools.sharedETH().request("POST", urlString: "", parameters: parameters) { (result, error) in
            if result == nil {
                return
            }
            let amount = (result as! [String: Any])["result"]
            if error != nil {
                resource(nil, error! as NSError)
            } else {
                resource(amount , nil)
            }
        }
    }
    //
    @objc class func getTxList(address: String, resource: @escaping (_ content:Any?, _ error:NSError?) ->()) {
        let parameters: [String: Any] = ["module": "account", "action": "txlist", "address": address, "startblock": 0, "endblock": 99999999, "sort": "asc", "apikey": "9HPK28K9SRH6494V1ZBAZCU8NS4XDDZWF4"]
        UseWalletNetworkTools.sharedEtherscan().request("GET", urlString: "", parameters: parameters) { (result, error) in
            if error != nil {
                resource(nil, error! as NSError)
            } else {
                resource(result , nil)
            }
        }
    }
    @objc class func getGasPricePerWei(resource: @escaping (_ content:Any?, _ error:NSError?) ->()) {
        let parameters: [String: Any] = ["jsonrpc": "2.0", "method": "eth_gasPrice", "params": [], "id": 73]
        UseWalletNetworkTools.sharedETH().request("POST", urlString: "", parameters: parameters) { (result, error) in
            if error != nil {
                resource(nil, error! as NSError)
            } else {
                resource(result , nil)
            }
        }
    }
    @objc class func getERC20AddressInfo(address: String, resource: @escaping (_ content:Any?, _ error:NSError?) ->()) {
        let parameters: [String: Any] = ["apiKey": "freekey"]
        UseWalletNetworkTools.sharedEthplorer().request("GET", urlString: "getAddressInfo/" + address, parameters: parameters) { (result, error) in
            if error != nil {
                resource(nil, error! as NSError)
            } else {
                resource(result , nil)
            }
        }
    }
    @objc class func getTokenInfo(address: String, resource: @escaping (_ content:Any?, _ error:NSError?) ->()) {
        // https://api.ethplorer.io/getTokenInfo/0x83e77dF60f66a5475fd9feCdc90306b0C1EDDD29?apiKey=freekey
        let parameters: [String: Any] = ["apiKey": "freekey"]
        UseWalletNetworkTools.sharedEthplorer().request("GET", urlString: "getTokenInfo/" + address, parameters: parameters) { (result, error) in
            if error != nil {
                resource(nil, error! as NSError)
            } else {
                resource(result , nil)
            }
        }
    }
    @objc class func getTopToken(critiea: String, resource: @escaping (_ content:Any?, _ error:NSError?) ->()) {
        // https://api.ethplorer.io/getTop?apiKey=freekey&criteria=count
        //criteria: sort tokens by criteria [optional, trade - by trade volume, cap - by capitalization, count - by operations, default = trade]
        let parameters: [String: Any] = ["apiKey": "freekey", "criteria": critiea]
        UseWalletNetworkTools.sharedEthplorer().request("GET", urlString: "getTop", parameters: parameters) { (result, error) in
            if error != nil {
                resource(nil, error! as NSError)
            } else {
                resource(result , nil)
            }
        }
    }
    
}


////BTC相关
extension UseChainNetSwift {
    @objc class func tickerOfBTC(platform:String, resource: @escaping (_ content:Any?, _ error:NSError?) ->()) {
        //https://www.btc123.com/api/getTicker?symbol=bitfinexbtcusd
        let parameters: [String: Any] = ["symbol": platform]
        UseWalletNetworkTools.sharedBTC123().request("GET", urlString: "getTicker", parameters: parameters) { (result, error) in
            if error != nil {
                resource(nil, error! as NSError)
            }else {
                if ((result as! [String: Any])["datas"] as! [String: Any])["ticker"] == nil {
                    //                    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"is a error test"                                                                      forKey:NSLocalizedDescriptionKey];
                    let userInfo = [NSLocalizedDescriptionKey: NSLocalizedString("BTC price is not available", comment: "BTC价格不可用")]
                    let error = NSError(domain: "", code: 1999, userInfo: userInfo)
                    resource(nil, error)
                } else {
                    let sell = (((((result as! [String: Any])["datas"]) as! [String: Any])["ticker"]) as! [String: Any])["sell"];
                    resource(sell , nil)
                }
            }
        }
    }
    @objc class func balanceFromBlockChainWith(address:String, resource: @escaping (_ content:Any?, _ error:NSError?) ->()) {
        let parameters: [String: Any] = ["active": address]
        UseWalletNetworkTools.sharedBlockChain().request("GET", urlString: "balance", parameters: parameters) { (result, error) in
            if error != nil {
                resource(nil, error! as NSError)
            }else {
                let balance = ((result as! [String: Any])[address] as! [String: Any])["final_balance"]
                resource(balance, nil)
            }
        }
    }
    @objc class func latestBlockFromBlockChain(resource: @escaping (_ content:Any?, _ error:NSError?) ->()) {
        UseWalletNetworkTools.sharedBlockChain().request("GET", urlString: "latestblock", parameters: "") { (result, error) in
            if error != nil {
                resource(nil, error! as NSError)
            }else {
                let latestBlock = (result as! [String: Any])["height"] as! Int
                resource(latestBlock, nil)
            }
        }
    }
    @objc class func hdAccountTxAddressFromBlockchain(txhash: String, resource: @escaping (_ content:Any?, _ error:NSError?) ->()) {
        UseWalletNetworkTools.sharedBlockChain().request("GET", urlString: "rawtx/" + txhash, parameters: nil) { (result, error) in
            if error != nil {
                resource(nil, error! as NSError)
            }else {
                resource(result, nil)
            }
        }
    }
    @objc class func hdAccountDetailTxFromChain(txhash: String, resource: @escaping (_ content:Any?, _ error:NSError?) ->()) {
        UseWalletNetworkTools.sharedChain().request("GET", urlString: txhash, parameters: nil) { (result, error) in
            if error != nil {
                resource(nil, error! as NSError)
            }else {
                resource(result, nil)
            }
        }
    }
    
}
