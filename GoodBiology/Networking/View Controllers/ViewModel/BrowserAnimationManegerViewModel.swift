//
//  BrowserAnimationManegerViewModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 13.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import WebKit

//MARK: - WebViewLoadAnimationsViewModel main class
final class BrowserAnimationManegerViewModel {
    public func setWebViewAlpha(_ webView: WKWebView, alpha: CGFloat) {
        webView.alpha = alpha
    }
    
    public func webViewReload(_ webView: WKWebView) {
        webView.reload()
    }
    
    public func labelHiddenSet(_ label: UILabel) {
        label.isHidden = true
    }
}
