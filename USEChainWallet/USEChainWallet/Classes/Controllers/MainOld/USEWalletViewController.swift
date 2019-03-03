//
//  USEWalletViewController.swift
//  USEChainWallet
//
//  Created by Jacob on 2019/3/1.
//  Copyright © 2019 Jacob. All rights reserved.
//

import UIKit

private let USEWalletAssetCellID = "USEWalletAssetCellID"

class USEWalletViewController: UIViewController {

    override func loadView() {
        super.loadView()
        setupUI()
        prepareTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        //self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //MARK: -LazyloadKit
    fileprivate lazy var qrCodeBtn: UIButton = UIButton(title: "", fontSize: 15, color: UIColor.black, imageName: "u27")
    fileprivate lazy var unKnownBtn: UIButton =  UIButton(title: "", fontSize: 15, color: UIColor.black, imageName: "u29")
    
    fileprivate lazy var hostWallet: UILabel = UILabel(title: "小优的钱包", fontSize: 15, color: UIColor.black, redundance: 0)
    fileprivate lazy var address: UILabel = UILabel(title: "0xSDWWERF...SDA23FD", fontSize: 15, color: UIColor.black, redundance: 0)
    fileprivate lazy var copyBtn: UIButton = UIButton(title: "", fontSize: 10, color: UIColor.black, imageName: "u25")
    
    fileprivate lazy var clientBtn: UIButton = UIButton(title: "", fontSize: 15, color: UIColor.black, imageName: "u100")
    fileprivate lazy var estimateMoney: UILabel = UILabel(title: "≈ ¥99999999.15", fontSize: 15, color: UIColor.black, redundance: 0)
    fileprivate lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    
    fileprivate lazy var assetLabel: UILabel = UILabel(title: "资产", fontSize: 15, color: UIColor.black, redundance: 0)
    fileprivate lazy var addAssetBtn: UIButton = UIButton(title: "", fontSize: 15, color: UIColor.black, imageName: "u1413")
    
    fileprivate lazy var assetTableview: UITableView = UITableView()
}

extension USEWalletViewController {
    fileprivate func setupUI() {
        // addSubviews
        self.view.addSubview(qrCodeBtn)
        self.view.addSubview(unKnownBtn)
        
        self.view.addSubview(hostWallet)
        self.view.addSubview(address)
        self.view.addSubview(copyBtn)

        self.view.addSubview(clientBtn)
        self.view.addSubview(estimateMoney)
        self.view.addSubview(lineView)

        self.view.addSubview(assetLabel)
        self.view.addSubview(addAssetBtn)
        
        self.view.addSubview(assetTableview)
        
        for v in self.view.subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        // layout
        qrCodeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(60)
            make.left.equalTo(self.view).offset(20)
        }
        unKnownBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(46)
            make.right.equalTo(self.view).offset(-20)
            make.width.height.equalTo(40)
        }
        hostWallet.snp.makeConstraints { (make) in
            make.top.equalTo(qrCodeBtn.snp.bottom).offset(40)
            make.left.equalTo(qrCodeBtn)
        }
        address.snp.makeConstraints { (make) in
            make.top.equalTo(hostWallet.snp.bottom).offset(10)
            make.left.equalTo(hostWallet.snp.left)
        }
        copyBtn.snp.makeConstraints { (make) in
            make.top.equalTo(address)
            make.left.equalTo(address.snp.right).offset(10)
            make.height.width.equalTo(20)
        }
        clientBtn.snp.makeConstraints { (make) in
            make.top.equalTo(hostWallet)
            make.right.equalTo(self.view).offset(-30)
            make.height.width.equalTo(40)
        }
        estimateMoney.snp.makeConstraints { (make) in
            make.top.equalTo(clientBtn.snp.bottom).offset(40)
            make.right.equalTo(self.view).offset(-20)
        }
        
//        lineView.
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(estimateMoney.snp.bottom).offset(20)
            make.left.right.equalTo(self.view)
            make.height.equalTo(1)
        }
        assetLabel.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom).offset(20)
            make.left.equalTo(self.view).offset(20)
        }
        addAssetBtn.snp.makeConstraints { (make) in
            make.top.equalTo(assetLabel)
            make.right.equalTo(self.view).offset(-20)
            make.height.width.equalTo(30)
        }
        assetTableview.snp.makeConstraints { (make) in
            make.top.equalTo(addAssetBtn.snp.bottom).offset(20)
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view.bottom)
        }
    }
}

extension USEWalletViewController: UITableViewDelegate, UITableViewDataSource {
    fileprivate func prepareTableView() {
        assetTableview.delegate = self
        assetTableview.dataSource = self
        assetTableview.register(USEWalletAssetCell.self, forCellReuseIdentifier: USEWalletAssetCellID)
        assetTableview.tableFooterView = UIView()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: USEWalletAssetCellID) as! USEWalletAssetCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           self.navigationController?.pushViewController(USECoinDetailVC(), animated: true)
//        self.navigationController?.present(USECoinDetailVC(), animated: true, completion: {
//
//        })
    }
}
