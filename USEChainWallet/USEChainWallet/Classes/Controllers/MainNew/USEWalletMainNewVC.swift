//
//  USEWalletMainViewController.swift
//  USEChainWallet
//
//  Created by Jacob on 2019/2/28.
//  Copyright © 2019 Jacob. All rights reserved.
//

import UIKit
import SnapKit

class USEWalletMainNewVC: UIViewController {

    @objc private func clickedBtn(btn: UIButton) {
        if btn.tag == 1 {
            // 创建钱包
            
        } else {
            // 导入钱包
            
        }
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
    }
    // MARK: -Lazyloadkit
    fileprivate lazy var titleLabelTop: UILabel = UILabel(title: "创建你的第一个", fontSize: 16, color: UIColor.black, redundance: 0)
    fileprivate lazy var titleLabelBottom: UILabel = UILabel(title: "数字钱包", fontSize: 16, color: UIColor.black, redundance: 0)
    fileprivate lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    fileprivate lazy var createBtn: UIButton = {
        let btn = UIButton(title: "创建钱包", fontSize: 20, color: UIColor.white, imageName: nil, backColor: UIColor.blue)
        btn.layer.cornerRadius = 10
        btn.tag = 1
        btn.addTarget(self, action: #selector(USEWalletMainNewVC.clickedBtn(btn:)), for: UIControl.Event.touchUpInside)
        return btn
    }()
    fileprivate lazy var importWalletBtn: UIButton = {
        let btn = UIButton(title: "导入钱包", fontSize: 20, color: UIColor.black, imageName: nil, backColor: UIColor.gray)
        btn.tag = 2
        btn.addTarget(self, action: #selector(USEWalletMainNewVC.clickedBtn(btn:)), for: UIControl.Event.touchUpInside)
        btn.layer.cornerRadius = 10
        return btn
    }()
}

extension USEWalletMainNewVC {
    fileprivate func setupUI() {
        // addSubview
        self.view.addSubview(titleLabelTop)
        self.view.addSubview(titleLabelBottom)
        self.view.addSubview(lineView)
        self.view.addSubview(createBtn)
        self.view.addSubview(importWalletBtn)
        for v in self.view.subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        // layout
        titleLabelTop.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(100)
            make.centerX.equalTo(self.view)
        }
        titleLabelBottom.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabelTop).offset(20)
            make.centerX.equalTo(titleLabelTop)
        }
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabelBottom).offset(60)
            make.left.right.equalTo(self.view)
            make.height.equalTo(1)
        }
        createBtn.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom).offset(80)
            make.centerX.equalTo(self.view)
            make.height.equalTo(40)
            make.width.equalTo(200)
        }
        importWalletBtn.snp.makeConstraints { (make) in
            make.top.equalTo(createBtn.snp.bottom).offset(20)
            make.left.right.equalTo(createBtn)
            make.height.equalTo(40)
        }
    }
}
