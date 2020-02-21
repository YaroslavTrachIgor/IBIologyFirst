//
//  BasicMFMailComposeViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 18.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

protocol BasicMFMailComposeViewControllerProtocol {
    func setup()
}

class BasicMFMailComposeViewController: MFMailComposeViewController {
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
}

extension BasicMFMailComposeViewController: BasicMFMailComposeViewControllerProtocol {
    func setup() {
        let myStringMail = "zhbr282@gmail.com"
        
        setToRecipients([myStringMail])
    }
}
