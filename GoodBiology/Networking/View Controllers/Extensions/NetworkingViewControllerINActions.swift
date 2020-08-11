//
//  NetworkingViewControllerINActions.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 13.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - @IBActions
extension NetworkingViewController {
    @IBAction func pickerViewBackShowing(_ sender: Any) {
        if pickerViewBack.isHidden == true {
            pickerViewBack.isHidden = false
            explanatoryView.isHidden = false
        } else {
            pickerViewBack.isHidden = true
            explanatoryView.isHidden = true
        }
    }
    
    @IBAction func orgonize(_ sender: Any) {
        if switchView.isHidden == true {
            switchView.isHidden = false
        } else {
            switchView.isHidden = true
        }
    }
    
    @IBAction func `switch`(_ sender: UISwitch) {
        let isOn = sender.isOn
        wikiButton.isEnabled = isOn
        nextButton.isEnabled = isOn
        backButton.isEnabled = isOn
        textSwitchView.text = isOn == true ? "Hide  diffrent functions" : "Show diffrent functions"
    }
    
    @IBAction func wikiOpen(_ sender: Any) {
        urlAnimation(url: URLs.wikiURL)
    }
    
    @IBAction func wikiOpenWithGestureRecognizer(_ sender: Any) {
        urlAnimation(url: URLs.wikiURL)
    }
    
    @IBAction func goForwardAction(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
        backItemGiven()
    }

    @IBAction func goBackButton(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
}
