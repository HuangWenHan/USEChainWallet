//
//  USEMineViewController.swift
//  USEChainWallet
//
//  Created by Jacob on 2019/3/1.
//  Copyright © 2019 Jacob. All rights reserved.
//

import UIKit

private let USEWalletMineCellID = "USEWalletMineCellID"

class USEMineViewController: UIViewController {

    override func loadView() {
        super.loadView()
        setupUI()
        perpareTableView()
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
    //MARK: -Lazyloadkit
    fileprivate lazy var topImageView: UIImageView = UIImageView(image: UIImage.init(named: "u47"))
    fileprivate lazy var titleLabel: UILabel = UILabel(title: "USE", fontSize: 15, color: UIColor.black, redundance: 0)
    fileprivate lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    fileprivate lazy var mineTableView: UITableView = UITableView()
    
}

extension USEMineViewController {
    fileprivate func setupUI() {
        //addSubviews
        self.view.addSubview(topImageView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(lineView)
        self.view.addSubview(mineTableView)
        for v in self.view.subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        // layout
        topImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(100)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(topImageView.snp.bottom).offset(20)
        }
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.left.right.equalTo(self.view)
            make.height.equalTo(1)
        }
        mineTableView.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom).offset(10)
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
    }
}

extension USEMineViewController: UITableViewDelegate, UITableViewDataSource {
    fileprivate func perpareTableView() {
        mineTableView.delegate = self
        mineTableView.dataSource = self
        mineTableView.register(USEWalletMineCell.self, forCellReuseIdentifier: USEWalletMineCellID)
        mineTableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: USEWalletMineCellID) as! USEWalletMineCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
