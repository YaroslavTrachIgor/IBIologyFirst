//
//  NetworkingViewControllerUIActivityIndicatorView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 17.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - UIActivityIndicatorView extension
public extension UIActivityIndicatorView {
    func activityWake() {
        color = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        startAnimating()
        hidesWhenStopped = true
    }
    
    func activityStartsToSleep() {
        stopAnimating()
    }
}
