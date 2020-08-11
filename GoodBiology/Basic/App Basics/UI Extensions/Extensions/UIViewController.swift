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

public extension UIViewController {
    
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
    
    //MARK: - Setup NavBar Hidden on Tap
    func articleVCProperty_NavBarHiddenSet() {
        navigationController?.hidesBarsOnTap = true
    }
    
    //MARK: - Setup TabBar Hidden
    func setTabBarHidden(_ hidden: Bool) {
        tabBarController?.tabBar.isHidden = hidden
    }
}


 
//MARK: - BasicViewControllerStatusBarBackColorSetupProtocol protocol
protocol BasicViewControllerStatusBarBackColorSetupProtocol {}



//MARK: - BasicViewControllerStatusBarBackColorSetupProtocol extension
extension BasicViewControllerStatusBarBackColorSetupProtocol {
    func setupStatusBar(for vc: UIViewController, backColor: UIColor) {
        if DeviceType.IS_IPHONE_5 || DeviceType.IS_IPHONE_7 || DeviceType.IS_IPHONE_7P {
            setupStatusBarView(with: 20, for: vc, backColor: backColor)
        } else {
            setupStatusBarView(with: 50, for: vc, backColor: backColor)
        }
    }
    
    //MARK: Private
    private func setupStatusBarView(with size: CGFloat, for vc: UIViewController, backColor: UIColor) {
        let statusBarView = UIView(frame: CGRect(x: 0, y: 0, width: vc.view.frame.width, height: size))
        statusBarView.backgroundColor = backColor
        vc.navigationController?.view.addSubview(statusBarView)
    }
}
