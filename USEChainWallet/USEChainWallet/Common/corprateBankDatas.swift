//
//  corprateBankDatas.swift
//  Dazui
//
//  Created by Mr_朱 on 2017/3/20.
//  Copyright © 2017年 you. All rights reserved.
//

import UIKit

class corprateBankDatas: NSObject {
    //cardDatas类的集合
    static var shared : corprateBankDatas {
        struct Static {
            static let instance : corprateBankDatas = corprateBankDatas()
        }
        if Static.instance.oldDatas == nil{
            Static.instance.oldDatas = [Any]()
        }
        if Static.instance.newDatas == nil{
            Static.instance.newDatas = [Any]()
        }
        return Static.instance
    }
     //已购
    var oldDatas:[Any]?
     //新债
    var newDatas:[Any]?
    //账户余额
    var accountMoney : Double?
    //昨日收益
    var yesterdayMoney : Double?
    //累计收益
    var leijiMoney : Double?
    
     func setAccMoney(_ accMoney:Double){
        accountMoney = accMoney
    }
    func setYesMoney(_ yesMoney:Double){
        yesterdayMoney = yesMoney
    }
    func setLeiMoney(_ leiMoney:Double){
        leijiMoney = leiMoney
    }
}
