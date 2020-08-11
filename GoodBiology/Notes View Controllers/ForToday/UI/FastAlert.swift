//
//  FastAlert.swift
//  GoodBiology
//
//  Created by Yaroslav on 22.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

final class FastAlert {
    typealias Action = () -> Void
    
    class func showBasic(title: String?, message: String?, vc: UIViewController) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: BasicTestWords.okWord, style: .cancel, handler: nil)
        
        alertVC.view.tintColor = .biologyGreenColor
        
        alertVC.setTitle(font: UIFont(name: BasicFonts.boldFont, size: 16), color: .none)
        alertVC.setMessage(font: UIFont(name: BasicFonts.mediumFont, size: 13), color: .none)
        
        alertVC.addAction(okAction)
        vc.present(alertVC, animated: true)
    }
}

