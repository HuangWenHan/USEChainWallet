//
//  DZUserDefaults.swift
//  Dazui
//
//  Created by wakaka on 2017/9/7.
//  Copyright © 2017年 you. All rights reserved.
//

import UIKit


/// 用户信息
///
/// - province: 省
/// - area: 区
/// - city: 市
/// - avatar: 头像
/// - isauth: 是否认证
/// - mobile: 手机号
/// - loginMobile: 登录手机号
/// - name: 真实姓名
/// - nickname: 昵称
/// - sex: 性别
/// - signature: 个性签名
/// - token: token
/// - userid: userID
/// - timeInterval: timeInterval
enum UserInfo: String {
    case province
    case area
    case city
    case avatar
    case isauth
    case mobile
    case loginMobile
    case name
    case nickname
    case sex
    case signature
    case token
    case userid
    case timeInterval
}

// MARK: - 读取用户信息
extension UserInfo {
    var info: Any? {
        get {
            switch self {
            case .province:
                return DZUserDefaults.value(for: self)
            case .area:
                return DZUserDefaults.value(for: self)
            case .city:
                return DZUserDefaults.value(for: self)
            case .avatar:
                return DZUserDefaults.value(for: self)
            case .isauth:
                return DZUserDefaults.value(for: self)
            case .mobile:
                return DZUserDefaults.value(for: self)
            case .name:
                return DZUserDefaults.value(for: self)
            case .nickname:
                return DZUserDefaults.value(for: self)
            case .sex:
                return DZUserDefaults.value(for: self)
            case .token:
                return DZUserDefaults.value(for: self)
            case .userid:
                return DZUserDefaults.value(for: self)
            case .timeInterval:
                return DZUserDefaults.value(for: self)
            default:
                break
            }
            return nil
        }
    }
    
    static func setUserInfo(info: Any) {
        DZUserDefaults.userDefaults.set(info, forKey: "login")
    }
    
    static func updata(for key: UserInfo, new value: Any) {
        var tempDic = DZUserDefaults.userDefaults.value(forKey: "login") as! [String: Any]
        tempDic[key.rawValue] = value
        DZUserDefaults.userDefaults.set(tempDic, forKey: "login")
    }
    
    static func clear() {
        DZUserDefaults.clear()
    }
}

/// 使用用户偏好设置存储用户信息的封装
fileprivate class DZUserDefaults: UserDefaults {
    // 实例化
    fileprivate static let userDefaults = UserDefaults.standard
    
    // 存信息
    fileprivate static func setUserInfo(info: Any) {
        userDefaults.set(info, forKey: "login")
    }
    
    // 更新某个值
    fileprivate static func updata(for key: UserInfo, new value: Any) {
        var tempDic = userDefaults.value(forKey: "login") as! [String: Any]
        tempDic[key.rawValue] = value
        userDefaults.set(tempDic, forKey: "login")
    }
    
    // 获取值
    fileprivate static func value(for key: UserInfo) -> Any? {
        guard let dict = userDefaults.value(forKey: "login") as! [String: Any]? else {
            return nil
        }
        return dict[key.rawValue]
    }
    
    // 清除登录信息
    fileprivate static func clear() {
        userDefaults.removeObject(forKey: "login")
    }
}
