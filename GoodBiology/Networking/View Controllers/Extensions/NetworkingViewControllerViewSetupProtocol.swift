//
//  NetworkingViewControllerViewSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 17.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol NetworkingViewControllerViewSetupProtocol {
    func pickerViewBackPrefering()
    func systemBackColor()
    func switchViewPrefering()
    func loadingLabelSetup()
    func webViewBaxckgroundSetup()
    func webViewSetup()
    func webViewPrefering()
    func backItemGiven()
    func activityINPref()
}

extension NetworkingViewController: NetworkingViewControllerViewSetupProtocol {
    func backItemGiven() {
        if navigationItem.title == "Wikipedia" {
            navigationItem.title = "Internet"
        }
    }
    
    func webViewPrefering() {
        webViewSetup()
        webViewBaxckgroundSetup()
        loadingLabelSetup()
    }
    
    func webViewSetup() {
        webView.load(URLRequest(url: URL(string: "https://www.google.com")!))
        webView.transform          = CGAffineTransform(scaleX: 0, y: 0)
        webView.alpha              = 0
    }
    
    func webViewBaxckgroundSetup() {
        webViewBaxckground.layer.cornerRadius = CGFloat(cornerRadius)
        webViewBaxckground.viewShadows()
    }
    
    func loadingLabelSetup() {
        loadingLabel.textColor = #colorLiteral(red: 0.6289012432, green: 0.6279886961, blue: 0.6433200836, alpha: 1)
    }
    
    func switchViewPrefering() {
        switchView.isHidden = true
        
        switchView.editorsViews()
        switchOutlet.switchBasics()
        
        textSwitchView.switchTextViewPrefering()
    }
    
    func systemBackColor() {
        if #available(iOS 13.0, *) {
            pickerView.tintColor = .secondaryLabel
            
            pickerViewBack.viewSystemBack()
            switchView.viewSystemBack()
            
            view.viewSystemBack()
        }
    }
    
    func pickerViewBackPrefering() {
        pickerViewBack.viewSystemBack()
        pickerViewBack.layer.cornerRadius   = 12
        pickerViewBack.isHidden             = true
        
        pickerViewBack.viewShadows()
    }
    
    func activityINPref() {
        self.activityIndicator.activityIndicatorStarts(colorOfActivity: .darkGray)
    }
}
