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

//MARK: - BasicSafariVCProtocol protocol
protocol BasicSafariVCProtocol {
    func preferringBarTintColor()
    func preferringControlTintColor()
}



//MARK: - Basic SFSafariViewController main class
class BasicSafariVC: SFSafariViewController {
    func setupSafariVC() {
        preferringBarTintColor()
        preferringControlTintColor()
    }
}



//MARK: - BasicSafariVCProtocol extension
extension BasicSafariVC: BasicSafariVCProtocol {
    func preferringBarTintColor() {

        ///Setup bars colors
        let specialBarTintColor = #colorLiteral(red: 0, green: 0.2316439748, blue: 0, alpha: 1)
        preferredBarTintColor = specialBarTintColor
    }
    
    func preferringControlTintColor() {
        
        ///Setup controls colors
        preferredControlTintColor = .white
    }
}
