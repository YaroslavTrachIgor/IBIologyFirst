//
//  NetworkingViewControllWebControllerDelegate.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 13.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

// MARK: - WebControllerDelegate
extension NetworkingViewController: WebControllerDelegate {
    func checkWifi() {
        let networkStatus = Reachability().connectionStatus()
        switch networkStatus {
        case .Unknown, .Offline:
            FastAlert.showBasic(title: "Oops", message: "You are not connected to WiFi", vc: self)
        case .Online(.WWAN): break
        case .Online(.WiFi): break
        }
    }
    
    func networkingProccesesPrefering() {
        let firstQueue = DispatchQueue.global(qos: .utility)
        let mainBrowserVCDispatchGroup = DispatchGroup()
        
        firstQueue.async {
            mainBrowserVCDispatchGroup.enter()
            DispatchQueue.main.async {
                self.webViewLoad()
                self.activityINPref()
                self.checkWifi()
            }
            mainBrowserVCDispatchGroup.leave()
        }
        webViewPrefering()
    }
    
    func viewBasicProccesesPrefering() {
        switchViewPrefering()
        pickerViewBackPrefering()
        systemBackColor()
        viewModel.setupNavigationItem(navigationController!.navigationBar)
    }
}
