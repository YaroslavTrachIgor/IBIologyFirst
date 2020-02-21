//
//  SettingsTableViewSaveAllActionsFunctionsProtocolExtension.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 19.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension SettingsTableViewController: SettingsTableViewSaveAllActionsFunctionsProtocol {
    func acSubViewSetup() {
        acSubView = UIView(frame: self.view.bounds)
        acSubView?.backgroundColor = .groupTableViewBackground
        acSubView?.layer.cornerRadius = 10
        
        acSubView?.viewShadows()
        
        view.addSubview(acSubView!)
    }
    
    func acIndicatorViewSetup() {
        acInViewIndicator.center = self.acSubView!.center
        acInViewIndicator.startAnimating()
        if #available(iOS 13.0, *) {
            acInViewIndicator.style = .large
        }
        acInViewIndicator.activityIndicatorViewShadow()
        
        acSubView?.addSubview(acInViewIndicator)
    }
    
    func saveImageIcon() {
        let imageData: NSData = self.usersIconImageView.image!.pngData()! as NSData
        let queue = DispatchQueue.global(qos: .utility)
            queue.async {
            UserDefaults.standard.set(imageData, forKey: SettingsKeys.imageKey)
        }
    }
    
    func navItemSetup() {
        navigationItem.title = ""
    }
    
    func buttonsEnabledSetup() {
        let isEnabled = false
        
        editButton.isEnabled  = isEnabled
        shareButton.isEnabled = isEnabled
        saveButton.isEnabled  = isEnabled
    }
    
    func loadAnimationSetup() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.27) {
            self.navigationItem.title = "User"
            
            self.acSubView?.isHidden = true
            self.acSubView?.alpha = 0
            
            let isEnabled = true
            
            self.editButton.isEnabled  = isEnabled
            self.shareButton.isEnabled = isEnabled
            self.saveButton.isEnabled  = isEnabled
        }
    }
}
