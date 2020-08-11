//
//  SettingsTableViewSaveAllActionsFunctionsProtocolExtension.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 19.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import SwiftEntryKit

extension SettingsTableViewController: SettingsTableViewSaveAllActionsFunctionsProtocol {
    internal func acSubViewSetup() {
        acSubView = UIView(frame: self.view.bounds)
        
        saveFunctionViewModel.acSubViewSetup(with: acSubView!, mainView: view)
    }
    
    internal func acIndicatorViewSetup() {
        let animation = UIViewPropertyAnimator(duration: 1, curve: .easeIn) {
            self.saveFunctionViewModel.acInViewIndicator_StartAnimation_Setup(with: self.acInViewIndicator, mainView: self.acSubView!)
        }
        UIView.animate(withDuration: 1) {
            animation.startAnimation()
        }
        saveFunctionViewModel.acInViewIndicator_EndAnimation_Setup(with: self.acInViewIndicator, mainView: self.acSubView!)
    }
    
    internal func saveImageIcon() {
        let imageData: NSData = self.usersIconImageView.image!.pngData()! as NSData
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            UserDefaults.standard.set(imageData, forKey: SettingsKeys.imageKey)
        }
        
        UserDefaults.standard.set(self.firstNameLabel.text!,    forKey: SettingsKeys.nameLabelKey)
        UserDefaults.standard.set(self.secondNameLabel.text!,   forKey: SettingsKeys.secondNameLabelKey)
        UserDefaults.standard.set(self.emailLabel.text!,        forKey: SettingsKeys.emailLabelKey)
        lastSaveButtonDateSetup()
    }
    
    internal func navItemSetup() {
        saveFunctionViewModel.navigationTitleSet(navItem: navigationItem)
    }
    
    internal func buttonsEnabledSetup() {
        saveFunctionViewModel.buttonsEnabledSetup(buttons: editButton, enabled: false)
        saveFunctionViewModel.buttonsEnabledSetup(buttons: shareButton, enabled: false)
        saveFunctionViewModel.buttonsEnabledSetup(buttons: saveButton, enabled: false)
    }
    
    internal func loadAnimationSetup() {
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
    
    internal func lastSaveButtonDateSetup() {
        let date = LocalizedDate("us", datePosix: "MMMM d  'at'  h:mm a")
        let content = "Last Save: " + date.returnDate()
        
        /// Set Label text
        saveFunctionViewModel.lastSaveButton(lastSaveButton, content: content)
        
        /// Save Label text
        defaults.setValue(lastSaveButton?.titleLabel?.text!, forKey: SettingsKeys.lastSave)
    }
    
    internal func presentSaveView() {
        SwiftEntryKit.display(entry: SaveView.instanceFromNib(), using: setupDoneTestPopViewAttributes())
    }
    
    //MARK: - Private
    private func setupDoneTestPopViewAttributes() -> EKAttributes {
        var attributes = EKAttributes.centerFloat
        attributes.displayDuration                    = .infinity
        attributes.shadow                             = .active(with: .init(color: .init(light: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), dark: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), opacity: 20, radius: 15, offset: CGSize.zero))
        attributes.screenInteraction                  = .dismiss
        attributes.entryInteraction                   = .absorbTouches
        attributes.scroll                             = .enabled(swipeable: true, pullbackAnimation: .jolt)
        attributes.positionConstraints.verticalOffset = 10
        return attributes
    }
}
