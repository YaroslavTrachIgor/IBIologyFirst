//
//  BrowserAnimationManeger.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 13.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import WebKit
import UIKit

//MARK: - NETWORK Animation Maneger
final class BrowserAnimationManeger {
    public func urlAnimation(activityIndicator: UIActivityIndicatorView, webView: WKWebView, url: String?) {
        UIView.animate(withDuration: 6) {
            let networkAnimViewModel = BrowserAnimationManegerViewModel()
            networkAnimViewModel.setWebViewAlpha(webView, alpha: 0)
            
            guard let stringURL = url else { return }
            guard let requestURL = URL(string: stringURL) else { return }
            let request = URLRequest(url: requestURL)
        
            //MARK: load URLRequest
            DispatchQueue.main.async {
                webView.load(request)
            }
            
            //MARK: Animation
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.23, execute: {
                UIView.animate(withDuration: 0.6, delay: 0.6, options: .curveLinear, animations: {
                    
                    /// Start Animate ActivityIndicator
                    networkAnimViewModel.setWebViewAlpha(webView, alpha: 1)
                    
                    activityIndicator.activityWake()
                }) {(finished) in
                    /// Stop Animate ActivityIndicator
                    activityIndicator.activityStartsToSleep()
                }
            })
        }
    }
    
    public func coolReload(activityIndicator: UIActivityIndicatorView, webView: WKWebView) {
        let networkAnimViewModel = BrowserAnimationManegerViewModel()
        networkAnimViewModel.setWebViewAlpha(webView, alpha: 0)
        
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1.23, execute: {
            UIView.animate(withDuration: 0, delay: 1, options: .curveLinear, animations: {
                networkAnimViewModel.webViewReload(webView)
                networkAnimViewModel.setWebViewAlpha(webView, alpha: 1)
                
                activityIndicator.activityWake()
            }) {(finished) in
                UIView.animate(withDuration: 0.3, animations: {
                    activityIndicator.activityStartsToSleep()
                })
            }
        })
    }
    
    public func webViewLoad(_ webView: WKWebView, activityIndicator: UIActivityIndicatorView, loadingLabel: UILabel) {
        let networkAnimViewModel = BrowserAnimationManegerViewModel()
        UIView.animate(withDuration: 0, delay: 0.5, options: .curveLinear, animations: {
            networkAnimViewModel.setWebViewAlpha(webView, alpha: 1)
        }) {(finished) in
            activityIndicator.activityIndicatorStop()
            networkAnimViewModel.labelHiddenSet(loadingLabel)
        }
    }
}
