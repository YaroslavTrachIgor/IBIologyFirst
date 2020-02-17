//
//  WebViewLoadAnimationsSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 17.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox
import WebKit

protocol WebViewLoadAnimationsSetupProtocol {
    func webViewLoad()
    func coolReload()
    func urlAnimation(url: String)
}

extension NetworkingViewController: WebViewLoadAnimationsSetupProtocol {
    func webViewLoad() {
        UIView.animate(withDuration: 0, delay: 0.5, options: .curveLinear, animations: {
            self.webView.alpha = 1
        }) {(finished) in
            self.activityIndicator.activityIndicatorStop()
            self.loadingLabel.isHidden = true
        }
    }
    
    func coolReload() {
        self.webView.alpha = 0
        
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1.23, execute: {
            UIView.animate(withDuration: 0, delay: 1, options: .curveLinear, animations: {
                self.webView.reload()
                self.webView.alpha = 1
                
                self.activityIndicator.activityWake()
            }) {(finished) in
                UIView.animate(withDuration: 0.3, animations: {
                    self.activityIndicator.activityStartsToSleep()
                })
            }
        })
    }
    
    func urlAnimation(url: String) {
        UIView.animate(withDuration: 6) {
            self.webView.alpha = 0
            self.webView.load(URLRequest(url: URL(string: url)!))
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.23, execute: {
                UIView.animate(withDuration: 0.6, delay: 0.6, options: .curveLinear, animations: {
                    
                    // Start Animate ActivityIndicator
                    self.webView.alpha = 1
                    
                    self.activityIndicator.activityWake()
                }) {(finished) in
                    // Stop Animate ActivityIndicator
                    self.activityIndicator.activityStartsToSleep()
                }
            })
        }
    }
}
