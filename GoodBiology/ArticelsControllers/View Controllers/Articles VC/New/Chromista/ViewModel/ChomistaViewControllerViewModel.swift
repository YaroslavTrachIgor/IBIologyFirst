//
//  ChomistaViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 10.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - ChomistaViewControllerViewModelSetupProtocol protocol
protocol ChomistaViewControllerViewModelSetupProtocol: ChomistaViewControllerViewModelOverridesProtocol {
    func contentSetup(_ textView: UITextView, content: String)
    func backViewSetup(mainView: UIView, navController: UINavigationController)
    func setTextViewShadow(_ textView: UITextView)
    func cornersSetup(_ view: UIView)
    func alphaSetup(_ view: ContentBack)
    func chromistaVC_switchViewPropertiesSetup(switchOutlet: UISwitch, back: UIView)
    func setEditorsViewHideen_forShowingMethods(_ view: UIView, hidden: Bool)
    func textViewFontSetup(_ textView: UITextView, font: UIFont)
    func setupActivityVC(content: [String], for vc: UIViewController)
    func setupViewHidden(_ view: UIView, hidden: Bool)
    func setupViewHidden(_ button: UIBarButtonItem, enabled: Bool)
}



//MARK: - ChomistaViewControllerViewModelOverridesProtocol protocol
protocol ChomistaViewControllerViewModelOverridesProtocol {
    func setupViewDidApearAnimation(viewsArray: [UIView], secondViewsArray: [UIView])
}



//MARK: Main ChomistaViewControllerViewModel Class
class ChomistaViewControllerViewModel {}



//MARK: - ChomistaViewControllerViewModelSetupProtocol extension
extension ChomistaViewControllerViewModel: ChomistaViewControllerViewModelSetupProtocol {
    func setupViewDidApearAnimation(viewsArray: [UIView], secondViewsArray: [UIView]) {
        for (index, view) in viewsArray.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                view.alpha = 1
            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            for (index, view) in secondViewsArray.enumerated() {
                let delay: Double = Double((index)) * 0.2
                
                UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                    view.alpha = 1
                })
            }
        }
    }
    
    func setupActivityVC(content: [String], for vc: UIViewController) {
        
        /// Setup UIActivityViewController
        let acVC = UIActivityViewController(activityItems: content, applicationActivities: nil)
        UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        /// Present UIActivityViewController
        vc.present(acVC, animated: true)
    }
    
    func contentSetup(_ textView: UITextView, content: String) {
        textView.text = content
    }
    
    func textViewFontSetup(_ textView: UITextView, font: UIFont) {
        textView.font = font
    }
    
    func backViewSetup(mainView: UIView, navController: UINavigationController) {
        mainView.backgroundColor = .secondarySystemBackground
        navController.navigationBar.backgroundColor = .secondarySystemBackground
    }
    
    func setTextViewShadow(_ textView: UITextView) {
        textView.textViewShadow()
    }
    
    func cornersSetup(_ view: UIView) {
        view.layer.cornerRadius = 8
    }
    
    func alphaSetup(_ view: ContentBack) {
        view.alpha = 0
    }
    
    func chromistaVC_switchViewPropertiesSetup(switchOutlet: UISwitch, back: UIView) {
        back.isHidden = true
        switchOutlet.backgroundColor = .none
    }
    
    func setEditorsViewHideen_forShowingMethods(_ view: UIView, hidden: Bool) {
        view.isHidden = hidden
    }
    
    func setupViewHidden(_ view: UIView, hidden: Bool) {
        view.isHidden = hidden
    }
    
    func setupViewHidden(_ button: UIBarButtonItem, enabled: Bool) {
        button.isEnabled = enabled
    }
}
