//
//  TrashFunction.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 29.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox
import PopMenu
import NotificationBannerSwift

class BasicPopMenuAppearanceProperties {
    
    // Height and Corner Radius
    var basicPopMenuCornerRadius: CGFloat = 23
    var basicPopMenuActionHeight: CGFloat = 50
    
    // Basic Pop Menu Font
    var basicPopMenuAppearanceFont = UIFont(name: "AvenirNext-DemiBold", size: 16) ?? UIFont()
    
    // Imge Name (String)
    let imageName = "delete.right"
}

extension ForTodayViewController {
    
    //MARK: Internal
    internal func trash() {
        
        /// PopMenuManager Properties
        let manager             = PopMenuManager.default
        let managerProperties   = BasicPopMenuAppearanceProperties()
        
        /// Deleted Text (String)
        let deletedText = ""
        
        manager.actions = [PopMenuDefaultAction(title: "\(deleteWord) Headline and Content", image: UIImage(systemName: managerProperties.imageName), didSelect: { (_) in
            let deletedPart = "headline and content"
            
            /// Set empty text
            self.inputTextView.text  = deletedText
            self.inputTextField.text = deletedText
            
            /// Setup red StatusBar
            self.setupSaveBunner(deletedPart, englishPrefix: "were")
            
            /// Setup ErrorAllert
            self.setupError(deletedPart, englishPrefix: "are")
            
        }), PopMenuDefaultAction(title: "\(deleteWord) Headline", image: UIImage(systemName: managerProperties.imageName), didSelect: { (_) in
            let deletedPart = "headline"
            
            /// Set empty text
            self.inputTextField.text = deletedText
            
            /// Setup red StatusBar
            self.setupSaveBunner(deletedPart, englishPrefix: "was")
            
            /// Setup ErrorAllert
            self.setupError(deletedPart, englishPrefix: "is")
            
        }), PopMenuDefaultAction(title: "\(deleteWord) Content", image: UIImage(systemName: managerProperties.imageName), didSelect: { (_) in
            let deletedPart = "content"
            
            /// Set empty text
            self.inputTextView.text = deletedText
            
            /// Setup red StatusBar
            self.setupSaveBunner(deletedPart, englishPrefix: "was")
            
            /// Setup ErrorAllert
            self.setupError(deletedPart, englishPrefix: "is")
        })]
        
        /// Set menu view back color and opacity
        manager.popMenuAppearance.popMenuBackgroundStyle = .dimmed(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), opacity: 0.7)
        
        // Set UIFont
        manager.popMenuAppearance.popMenuFont = managerProperties.basicPopMenuAppearanceFont
        
        /// Set Corners
        manager.popMenuAppearance.popMenuCornerRadius = managerProperties.basicPopMenuCornerRadius
        
        /// Set animations
        manager.popMenuAppearance.popMenuPresentationStyle = .cover()
        
        /// Set Row Heighr
        manager.popMenuAppearance.popMenuActionHeight = managerProperties.basicPopMenuActionHeight
        
        /// Presnt Maneger
        manager.present(sourceView: deleteButtonBack)
        
        /// Setup Analytics
        setupAnalyticsAction()
    }
    
    //MARK: Private
    private func setupAnalyticsAction() {
        
        /// For Analytics
        AnalyticsManeger.addUserPropertie(name: "trash_Action", forName: UserPropertieNames.forTodayVC_UserPropertieName)
    }
    
    private func setupSaveBunner(_ part: String, englishPrefix: String) {
        
        /// Setup Banner
        let banner = StatusBarNotificationBanner(title: "Your note \(part) \(englishPrefix) deleted",
                                             style: .danger,
                                             colors: nil)
        let dismissEnabled = true
        
        /// Setup StatusBarNotificationBanner properties
        banner.autoDismiss  = dismissEnabled
        banner.dismissOnTap = dismissEnabled
        
        /// Show Banner
        banner.show()
    }
    
    private func setupError(_ part: String, englishPrefix: String) {
        FastAlert.showBasic(title: "Error",
                            message: "Your note \(part) \(englishPrefix) empty",
                            vc: self)
    }
}
