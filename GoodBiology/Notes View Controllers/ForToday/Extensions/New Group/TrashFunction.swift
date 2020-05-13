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
    func trash() {
        let manager = PopMenuManager.default
        let managerProperties = BasicPopMenuAppearanceProperties()
        let deletedText = ""
        
        manager.actions = [PopMenuDefaultAction(title: "\(deleteWord) Headline and Content", image: UIImage(systemName: managerProperties.imageName), didSelect: { (_) in
            self.inputTextView.text  = deletedText
            self.inputTextField.text = deletedText
            
        }), PopMenuDefaultAction(title: "\(deleteWord) Headline", image: UIImage(systemName: managerProperties.imageName), didSelect: { (_) in
            self.inputTextField.text = deletedText
            
        }), PopMenuDefaultAction(title: "\(deleteWord) Content", image: UIImage(systemName: managerProperties.imageName), didSelect: { (_) in
            self.inputTextView.text = deletedText
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
    }
}
