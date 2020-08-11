//
//  NetworkingViewControllerViewSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 17.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit


//MARK: - NetworkingViewControllerViewSetupProtocol extension
internal extension NetworkingViewController {
    func backItemGiven() {
        viewModel.backItemGiven(navigationItem)
    }
    
    func webViewPrefering() {
        webViewSetup()
        webViewBaxckgroundSetup()
        loadingLabelSetup()
    }
    
    func webViewSetup() {
        viewModel.webViewSetup(webView)
    }
    
    func webViewBaxckgroundSetup() {
        viewModel.webViewBaxckgroundSetup(webViewBaxckground)
    }
    
    func loadingLabelSetup() {
        viewModel.loadingLabelSetup(loadingLabel)
    }
    
    func switchViewPrefering() {
        viewModel.switchViewPrefering(switchOutlet: switchOutlet, textView: textSwitchView, view: switchView)
    }
    
    func systemBackColor() {
        viewModel.systemBackColor(pickerView: pickerView, switchView: switchView, pickerViewBack: pickerViewBack, mainView: view)
    }
    
    func pickerViewBackPrefering() {
        viewModel.pickerViewBackPrefering(pickerViewBack)
    }
    
    func activityINPref() {
        self.activityIndicator.activityIndicatorStarts(colorOfActivity: .darkGray)
    }
    
    func viewDidApperAnimation() {
        
        ///Arrays
        let objectsArray = [searchBar, webViewBaxckground, webView]
        let imageArray   = [image1, image2, image3, image4, image5]
        let buttonsArray = [goForwardButton, backButton, nextButton, wikiButton, sitesButton]
        
        for (index, images) in imageArray.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            /// setup images animation
            UIView.animate(withDuration: 0.3,
                           delay: delay,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveLinear,
                           animations: {
                
                /// setup first images animation
                images?.transform = CGAffineTransform(scaleX: 1.0,
                                                      y: 1.0)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                    
                    /// setup first images animation
                    images?.transform = CGAffineTransform(scaleX: 0, y: 0)
                }
            }, completion: { _ in
                /// Animate: barButtonItems
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    
                    /// setup animation
                    UIView.animate(withDuration: 5) {
                        for button in buttonsArray {
                            button?.isEnabled = true
                        }
                    }
                    
                    /// Animate: main views
                    for (index, objects) in objectsArray.enumerated() {
                        let delay: Double = Double((index)) * 0.2
                        
                        /// setup animation
                        UIView.animate(withDuration: 0.23,
                                       delay: delay,
                                       usingSpringWithDamping: 0.8,
                                       initialSpringVelocity: 0,
                                       options: .curveLinear,
                                       animations: {
                            
                            objects?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                        }, completion: nil)
                    }
                }
            })
        }
    }
}
