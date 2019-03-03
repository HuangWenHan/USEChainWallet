//
//  String + Extension.swift
//  Dazui
//
//  Created by wakaka on 2018/1/18.
//  Copyright © 2018年 you. All rights reserved.
//

import UIKit

extension String {
    var ellipsisSting: String {
        get {
            return self.count > 4 ? "\(self.substring(with: self.startIndex..<self.index(self.startIndex, offsetBy: 4)))..." : self
        }
    }
}

extension String {
    var htmlToString:String {
        return self.removingPercentEncoding!
    }
}

extension String {
    var URLEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    }
}

