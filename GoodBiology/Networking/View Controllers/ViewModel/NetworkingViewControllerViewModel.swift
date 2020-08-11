//
//  NetworkingViewControllerViewModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 04.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import WebKit

//MARK: - NetworkingViewController ViewModel main class
final public class NetworkingViewControllerViewModel {
    public func setupViewWillApearNavController(_ navigationController: UINavigationController) {
        let barHide = false
        navigationController.hidesBarsOnTap = barHide
        navigationController.hidesBarsOnSwipe = barHide
    }
    
    public func pickerViewBackPrefering(_ view: UIView) {
        view.viewSystemBack()
        view.layer.cornerRadius = 12
        view.isHidden = true
        view.viewShadows()
    }
    
    public func systemBackColor(pickerView: UIPickerView, switchView: UIView, pickerViewBack: UIView, mainView: UIView) {
        pickerView.tintColor = .secondaryLabel
        pickerViewBack.viewSystemBack()
        switchView.viewSystemBack()
        mainView.viewSystemBack()
    }
    
    public func switchViewPrefering(switchOutlet: UISwitch, textView: UITextView, view: UIView) {
        view.isHidden = true
        view.editorsViews()
        switchOutlet.switchBasics()
        textView.switchTextViewPrefering()
    }
    
    public func loadingLabelSetup(_ label: UILabel) {
        label.textColor = #colorLiteral(red: 0.6289012432, green: 0.6279886961, blue: 0.6433200836, alpha: 1)
    }
    
    public func webViewBaxckgroundSetup(_ view: UIView) {
        view.layer.cornerRadius = 12
        view.viewShadows()
    }
    
    public func backItemGiven(_ navItem: UINavigationItem) {
        if navItem.title == "Wikipedia" {
            navItem.title = "Internet"
        }
    }
    
    public func labelPickerViewSetup(_ label: UILabel, text: String?) {
        label.textColor = .darkGray
        label.font = UIFont(name: BasicFonts.mediumFont, size: 18.4)
        label.textAlignment = .center
        label.text = text
    }
    
    public func setupNavigationItem(_ navBar: UINavigationBar) {
        navBar.shadowImage = UIImage()
    }
    
    //MARK: - Setup main webView
    public func webViewSetup(_ webView: WKWebView) {
        
        /// Request
        guard let url = URL(string: "https://www.google.com") else { return }
        let urlRequest = URLRequest(url: url)
        
        setupLoadWithDoubleAction(webView: webView, load: urlRequest) {
            webView.transform = CGAffineTransform(scaleX: 0, y: 0)
            webView.alpha = 0
        }
    }
    
    //MARK: Private
    private func setupLoadWithDoubleAction(webView: WKWebView, load request: URLRequest, action: () -> Void) {
        webView.load(request)
        action()
    }
}
