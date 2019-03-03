//
//  USECoinDetailVC.swift
//  USEChainWallet
//
//  Created by Jacob on 2019/3/1.
//  Copyright © 2019 Jacob. All rights reserved.
//

import UIKit

private let USECoinDetailCellID = "USECoinDetailCellID"

class USECoinDetailVC: UIViewController {

    override func loadView() {
        super.loadView()
        self.navigationItem.title = "USE"
        setupUI()
        prepareTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    // MARK: -Lazyloadkit
    fileprivate lazy var coinCount: UILabel = UILabel(title: "3,000.123456", fontSize: 25, color: UIColor.black, redundance: 0)
    fileprivate lazy var estimateRMB: UILabel = UILabel(title: "≈ ￥ 1232.45", fontSize: 15, color: UIColor.gray, redundance: 0)
    fileprivate lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    fileprivate lazy var txRecordLabel: UILabel = UILabel(title: "交易记录", fontSize: 12, color: UIColor.gray, redundance: 0)
    fileprivate lazy var txRecordTableView: UITableView = UITableView()
    
    fileprivate lazy var gatheringBtn: UIButton = UIButton(title: "收款", fontSize: 15, color: UIColor.black, imageName: nil, backColor: UIColor.white)
    fileprivate lazy var translateBtn: UIButton =  UIButton(title: "转账", fontSize: 15, color: UIColor.black, imageName: nil, backColor: UIColor.white)
}

extension USECoinDetailVC {
    
    fileprivate func setupUI() {
        // addSubviews
        self.view.addSubview(coinCount)
        self.view.addSubview(estimateRMB)
        self.view.addSubview(lineView)
        self.view.addSubview(txRecordLabel)
        self.view.addSubview(txRecordTableView)
        
        self.view.addSubview(gatheringBtn)
        self.view.addSubview(translateBtn)
        
        for v in self.view.subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        // layout
        coinCount.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(110)
            make.centerX.equalTo(self.view)
        }
        estimateRMB.snp.makeConstraints { (make) in
            make.top.equalTo(coinCount.snp.bottom).offset(10)
            make.centerX.equalTo(self.view)
        }
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(estimateRMB.snp.bottom).offset(20)
            make.left.right.equalTo(self.view)
            make.height.equalTo(1)
        }
        txRecordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom).offset(10)
            make.left.equalTo(self.view).offset(20)
        }
        txRecordTableView.snp.makeConstraints { (make) in
            make.top.equalTo(txRecordLabel.snp.bottom).offset(20)
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(-40)
        }
        gatheringBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.height.equalTo(40)
            make.width.equalTo(UIScreen.main.bounds.size.width / 2)
        }
        translateBtn.snp.makeConstraints { (make) in
            make.right.bottom.equalTo(self.view)
            make.height.equalTo(40)
            make.width.equalTo(UIScreen.main.bounds.size.width / 2)
        }
    }
}

extension USECoinDetailVC: UITableViewDelegate, UITableViewDataSource {
    fileprivate func prepareTableView() {
        //txRecordTableView.delegate
        txRecordTableView.delegate = self
        txRecordTableView.dataSource = self
        txRecordTableView.register(USEWalletTxRecordCell.self, forCellReuseIdentifier: USECoinDetailCellID)
        txRecordTableView.tableFooterView = UIView()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: USECoinDetailCellID) as! USEWalletTxRecordCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    
}
