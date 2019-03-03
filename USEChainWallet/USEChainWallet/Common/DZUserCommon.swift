//
//  DZUserCommon.swift
//  Dazui
//
//  Created by wakaka on 2017/8/17.
//  Copyright © 2017年 you. All rights reserved.
//

import Presentr
import Foundation

//  颜色
//let dz_grayColor = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1)
//let dz_blueColor = UIColor.init(red: 83/256.0, green: 178/256.0, blue: 248/256.0, alpha: 1)
let dz_blueColor = UIColor(hexString: "#02b4fe")!
let dz_grayColor = UIColor(hexString: "#f3f3f3")!
///  屏幕宽度
let screenWidth = UIScreen.main.bounds.width
///  屏幕高度
let screenHeight = UIScreen.main.bounds.height
///  屏幕宽度适配参数（375为基准）
let kAdjustScale = UIScreen.main.bounds.width / 375

///  弹窗样式
let presenter: Presentr = {
    let width = ModalSize.fluid(percentage: 0.90)
    let height = ModalSize.custom(size: 250)
    let center = ModalCenterPosition.custom(centerPoint: CGPoint(x: screenWidth / 2, y: screenHeight / 2 - 120))
    let customType = PresentationType.custom(width: width, height: height, center: center)
    let presenter = Presentr(presentationType: customType)
    presenter.roundCorners = true
    presenter.cornerRadius = 10
    presenter.transitionType = nil
    presenter.dismissTransitionType = nil
    return presenter
}()

/// 输入数据长度限制
enum DZNumberLength: Int {
    case phoneNum = 100 // 由于上架香港，所以手机号码长度不再设限
    case verifyNum = 6
    case passwordLower = 8
    case passwordUpper = 16
}

// notification
let notificationToHomePage = "ToHomePage"
let notificationReloadData = "notificationReloadData"


/// baseUrl
let baseURL = "https://api.yunzic.com/api/"
//let baseURL = "http://192.168.11.22/yunzicDzb/public/api/"

/// 认证状态
///
/// - withoutAuth: 身份证未登记
/// - auth: 已认证
/// - authenticating: 审核中
enum AuthStatus: Int {
    case withoutAuth = 0
    case auth
    case authenticating
}

extension AuthStatus {
    var info: String {
        get {
            switch self {
            case .withoutAuth:
                return NSLocalizedString("ID card not registered", comment: "")
            case .auth:
                return NSLocalizedString("Authenticated", comment: "")
            case .authenticating:
                return NSLocalizedString("Auditing", comment: "")
            }
        }
    }
}

/// 我的界面cell样式
///
/// - common: 普通
/// - userInfo: 展示用户信息的cell
/// - withStatus: 带有状态的cell
enum UserCellStyle {
    case common
    case userInfo
    case withStatus
}






		
