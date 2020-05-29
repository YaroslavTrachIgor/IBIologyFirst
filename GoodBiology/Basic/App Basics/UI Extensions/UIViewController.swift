//
//  UIViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import UIKit
import SafariServices
import Foundation

extension UIViewController {
    
    //MARK: - Show SafariVC
    func showSafariVC(for url: String) {
        guard let url = URL(string: url) else { return }
        
        let safariVC = BasicSafariVC(url: url)
        safariVC.setupSafariVC()
        
        DispatchQueue.global(qos: .utility).async {
            DispatchQueue.main.async {
                self.present(safariVC, animated: true)
            }
        }
    }
    
    //MARK: - Sr=etup Bar Hidden on Tap
    func articleVCProperty_NavBarHiddenSet() {
        navigationController?.hidesBarsOnTap = true
    }
}
