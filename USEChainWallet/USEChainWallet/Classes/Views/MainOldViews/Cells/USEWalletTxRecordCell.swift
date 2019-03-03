//
//  USEWalletTxRecordCell.swift
//  USEChainWallet
//
//  Created by Jacob on 2019/3/1.
//  Copyright © 2019 Jacob. All rights reserved.
//

import UIKit

class USEWalletTxRecordCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.white
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: -LazyloadKit
    fileprivate lazy var address: UILabel = UILabel(title: "0xasdfeasd.....SADWAew123", fontSize: 15, color: UIColor.black, redundance: 0)
    fileprivate lazy var date: UILabel = UILabel(title: "02-23-2019 22:10:29", fontSize: 12, color: UIColor.gray, redundance: 0)
    fileprivate lazy var count: UILabel = UILabel(title: "+3,500.123123", fontSize: 18, color: UIColor.black, redundance: 0)
}

extension USEWalletTxRecordCell {
    fileprivate func setupUI() {
        // addSubviews
        self.contentView.addSubview(address)
        self.contentView.addSubview(date)
        self.contentView.addSubview(count)
        for v in self.contentView.subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        // layout
        address.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(10)
            make.left.equalTo(self.contentView).offset(10)
        }
        date.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(10)
            make.bottom.equalTo(self.contentView).offset(-10)
        }
        count.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(self.contentView).offset(-10)
        }
    }
}
