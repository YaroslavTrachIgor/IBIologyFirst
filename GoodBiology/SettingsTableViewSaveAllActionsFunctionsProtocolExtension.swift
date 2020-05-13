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
        
        saveFunctionViewModel.acSubViewSetup(with: acSubView!, mainView: view)
    }
    
    func acIndicatorViewSetup() {
        let animation = UIViewPropertyAnimator(duration: 1, curve: .easeIn) {
            self.saveFunctionViewModel.acInViewIndicator_StartAnimation_Setup(with: self.acInViewIndicator, mainView: self.acSubView!)
        }
        UIView.animate(withDuration: 1) {
            animation.startAnimation()
        }
        saveFunctionViewModel.acInViewIndicator_EndAnimation_Setup(with: self.acInViewIndicator, mainView: self.acSubView!)
    }
    
    func saveImageIcon() {
        let imageData: NSData = self.usersIconImageView.image!.pngData()! as NSData
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            UserDefaults.standard.set(imageData, forKey: SettingsKeys.imageKey)
        }
        
        UserDefaults.standard.set(self.firstNameLabel.text!,    forKey: SettingsKeys.nameLabelKey)
        UserDefaults.standard.set(self.secondNameLabel.text!,   forKey: SettingsKeys.secondNameLabelKey)
        UserDefaults.standard.set(self.emailLabel.text!,        forKey: SettingsKeys.emailLabelKey)
    }
    
    func navItemSetup() {
        saveFunctionViewModel.navigationTitleSet(navItem: navigationItem)
    }
    
    func buttonsEnabledSetup() {
        saveFunctionViewModel.buttonsEnabledSetup(buttons: editButton, enabled: false)
        saveFunctionViewModel.buttonsEnabledSetup(buttons: shareButton, enabled: false)
        saveFunctionViewModel.buttonsEnabledSetup(buttons: saveButton, enabled: false)
    }
    
    func loadAnimationSetup() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.27) {
            self.saveFunctionViewModel.loadAnimationSetup(with: self.navigationItem, with: self.acSubView!)
                
            self.saveFunctionViewModel.buttonsEnabledSetup(buttons: self.editButton, enabled: true)
            self.saveFunctionViewModel.buttonsEnabledSetup(buttons: self.shareButton, enabled: true)
            self.saveFunctionViewModel.buttonsEnabledSetup(buttons: self.saveButton, enabled: false)
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 600) {
                self.saveFunctionViewModel.buttonsEnabledSetup(buttons: self.saveButton, enabled: true)
            }
        }
    }
}
