//
//  USEWalletMainOldVC.swift
//  USEChainWallet
//
//  Created by Jacob on 2019/3/1.
//  Copyright © 2019 Jacob. All rights reserved.
//

import UIKit

class USEWalletMainOldVC: UITabBarController {

    override func loadView() {
        super.loadView()
        setupUI()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
    }
    //MARK: -Lazyload kit
    fileprivate lazy var walletVC: USEWalletViewController = USEWalletViewController()
    fileprivate lazy var discoverVC: USEDiscoverViewController = USEDiscoverViewController()
    fileprivate lazy var mineVC: USEMineViewController = USEMineViewController()
    
}
extension USEWalletMainOldVC {
    fileprivate func setupUI() {
        walletVC.tabBarItem.title = "钱包"
        discoverVC.tabBarItem.title = "发现"
        mineVC.tabBarItem.title = "我的"

        self.viewControllers = [walletVC, discoverVC, mineVC]

        tabBar.barStyle = UIBarStyle.black
        tabBar.isTranslucent = false
        tabBar.barTintColor = UIColor.brown
        tabBar.tintColor = UIColor.purple
    }
    
}
