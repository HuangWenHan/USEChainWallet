//
//  DZWalletBaseVC.swift
//  Dazui
//
//  Created by Jacob on 2017/3/10.
//  Copyright © 2017年 you. All rights reserved.
//

import UIKit

class DZWalletBaseVC: UIViewController {

    @objc func clickBtn() {
    
        _ = self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cusBackBtn()
    }
}

extension DZWalletBaseVC {
    //自定义左侧返回按钮
    fileprivate func cusBackBtn() {
        let backBtn = UIButton()
        backBtn.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        backBtn.setImage(UIImage.init(named: "backNew"), for: UIControl.State.normal)
        backBtn.setImage(UIImage.init(named: "backNew"), for: UIControl.State.highlighted)
        backBtn.sizeToFit()
        let backItem = UIBarButtonItem.init(customView: backBtn)
        backBtn.addTarget(self, action: #selector(DZWalletBaseVC.clickBtn), for: UIControl.Event.touchUpInside)
        self.navigationItem.leftBarButtonItem = backItem
    }
}
