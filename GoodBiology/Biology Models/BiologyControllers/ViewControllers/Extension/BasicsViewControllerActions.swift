//
//  BasicsViewControllerActions.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 18.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit


// MARK: - @IBActions
extension BiologyViewController {
    @IBAction func setNotification(sender: UIButton) {
        sender.notificationButtonBasicFunctions(view)
        
        /// UI animations
        let alertsManeger = AlertsManeger()
        alertsManeger.showNotificationView()
    }
    
    @IBAction func nextAction() {
        let title = navigationItem.title!
        
        showNext?()
        
        if title == "History" || title == "Evolution" || title == "Physiological" || title == "Botany" {
            showBunner()
        }
    }
    
    @IBAction func stepperViewShower(_ sender: UIBarButtonItem) {
        sender.viewShowingWithAnimation(animating: stepperView, main: view, {
            let cornerAnimation = UIViewPropertyAnimator(
                duration: 0.3,
                curve: .easeIn) {
                if self.stepperView.isHidden == true {
                    self.setCorners(radius: 30)
                } else {
                    self.setCorners(radius: 20)
                }
            }
            
            var isEnabled: Bool
            let hidden: Bool
            
            if self.stepperView.isHidden == true {
                isEnabled = true
                hidden    = false
                
                self.segmentedControl.isHidden  = hidden
                
            } else {
                isEnabled = false
                hidden    = true
            
                self.segmentedControl.isHidden  = hidden
            }
            cornerAnimation.startAnimation()
        })
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        let font     = contentTextView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        contentTextView.font = UIFont(name: font!, size: fontSize)
    }
    
    @IBAction func `switch`(_ sender: UISwitch) {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.4) {
            var alpha: CGFloat
            var hidesBarsOnSwipeEnabled: Bool
            var enabled:  Bool
            var isHidden: Bool
            
            if sender.isOn == true {
                hidesBarsOnSwipeEnabled = false
                self.navigationController?.hidesBarsOnSwipe = hidesBarsOnSwipeEnabled
                
                alpha = 1
                self.notificationButton.alpha = alpha
                self.segmentedControl.alpha = alpha
                self.stepperViewShowingButtonBack.alpha = alpha
                
                isHidden = false
                self.notificationButton.isHidden = isHidden
                self.segmentedControl.isHidden   = isHidden
                self.stepperViewShowingButtonBack.isHidden = isHidden
                
                enabled = true
                self.segmentedControl.isEnabled  = enabled
                
                self.switchTextView.text = "Hide  diffrent functions"
                
                self.view.layoutIfNeeded()
                
            } else {
                hidesBarsOnSwipeEnabled = true
                self.navigationController?.hidesBarsOnSwipe = hidesBarsOnSwipeEnabled
                
                alpha = 0
                self.notificationButton.alpha = alpha
                self.segmentedControl.alpha   = alpha
                self.stepperViewShowingButtonBack.alpha = alpha
                
                isHidden = true
                self.notificationButton.isHidden = isHidden
                self.segmentedControl.isHidden   = isHidden
                self.stepperViewShowingButtonBack.isHidden = isHidden
                
                self.switchTextView.text = "Show diffrent functions"
                
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func switchViewShowing(_ sender: UIBarButtonItem) {
        sender.viewShowingWithAnimation(animating: switchView, main: view, {
            let cornerAnimation = UIViewPropertyAnimator(
                duration: 0.3,
                curve: .easeIn) {
                    if self.switchView.isHidden == true {
                        self.setCorners(radius: 30)
                    } else {
                        self.setCorners(radius: 20)
                    }
            }
            
            if self.switchView.isHidden == true || self.switchTextView.text == "Hide  diffrent functions" {
                self.segmentedControl.isHidden = false
            } else {
                self.segmentedControl.isHidden = true
            }
            cornerAnimation.startAnimation()
        })
    }
    
    @IBAction func infoSwitch(_ sender: Any) {
        infoSwitchSetup()
    }
}
