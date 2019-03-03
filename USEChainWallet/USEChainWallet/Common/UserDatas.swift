//
//  userDatas.swift
//  Dazui
//      用户数据
//  Created by Mr_朱 on 2017/3/13.
//  Copyright © 2017年 you. All rights reserved.
//

import UIKit

class UserDatas: NSObject {
    
    //用户头像
    class func getUserIcon()->UIImage{
        return UIImage.init(named: "user_icon_s")!
    }
    //我的二维码
    class func getQrCode()->UIImage{
        return UIImage.init()
    }
    //背景图
    class func getBgImage()->UIImage{
        return UIImage.init()
    }
    //用户名
    class func getUserName()->String{
        return "小二黑"
    }
    //性别
    class func getSex()->String{
        return "女"
    }
    //地区
    class func getRegion()->String{
        return "地区"
    }
    //个性签名
    class func getSigna()->String{
        return "未填写"
    }
    //钱包账户
    class func getMoneyAccount()->String{
        return "18310777696"
    }
    //真实姓名
    class func getRealName()->String{
        return "狗蛋儿"
    }
}
