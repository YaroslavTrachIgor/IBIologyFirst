//
//  SFSafariViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 09.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import SafariServices
import UIKit

protocol BasicSafariVCProtocol {
    func preferringBarTintColor()
    func preferringControlTintColor()
}

class BasicSafariVC: SFSafariViewController {
    func setupSafariVC() {
        preferringBarTintColor()
        preferringControlTintColor()
    }
}

extension BasicSafariVC: BasicSafariVCProtocol {
    func preferringBarTintColor() {
        preferredBarTintColor = #colorLiteral(red: 0, green: 0.2316439748, blue: 0, alpha: 1)
    }
    
    func preferringControlTintColor() {
        preferredControlTintColor = .white
    }
}
