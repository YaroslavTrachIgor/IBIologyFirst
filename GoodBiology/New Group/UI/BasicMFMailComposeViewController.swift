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
    func setupComposer()
}

class BasicMFMailComposeViewController: MFMailComposeViewController {
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        
        setupComposer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupComposer()
    }
}

extension BasicMFMailComposeViewController: BasicMFMailComposeViewControllerProtocol {
    func setupComposer() {
        let queue = DispatchQueue(label: "BasicMFMailComposeViewControllerQueue", attributes: .concurrent)
        let group = DispatchGroup()
        
        queue.async {
            group.enter()
            DispatchQueue.main.async {
                let myStringMail = "zhbr282@gmail.com"
                
                self.setToRecipients([myStringMail])
                group.leave()
            }
        }
        DispatchQueue.main.async {
            self.view.tintColor = .biologyGreenColor
        }
    }
}
