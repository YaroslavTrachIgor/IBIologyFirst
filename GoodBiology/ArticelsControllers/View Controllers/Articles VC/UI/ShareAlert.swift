//
//  ShareAlert.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 26.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class ArticleShareFunction {
    static func showAlert(service: String, vc: UIViewController) {
        let alert = UIAlertController(title: "Error", message: "You are not connected to \(service)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(action)
        alert.view.tintColor = .biologyGreenColor
        
        vc.present(alert, animated: true, completion: nil)
    }
}
