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
    func urlAnimation(url: String?)
}

extension NetworkingViewController: WebViewLoadAnimationsSetupProtocol {
    func webViewLoad() {
        animationManeger.webViewLoad(webView, activityIndicator: activityIndicator, loadingLabel: loadingLabel)
    }
    
    func coolReload() {
        animationManeger.coolReload(activityIndicator: activityIndicator, webView: webView)
    }
    
    func urlAnimation(url: String?) {
        animationManeger.urlAnimation(activityIndicator: activityIndicator, webView: webView, url: url)
    }
}
