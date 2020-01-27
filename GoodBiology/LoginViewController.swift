//
//  LoginViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 28.11.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation

import UIKit
import LocalAuthentication
import AudioToolbox

class SecondLoginViewController: UIViewController {
    
    @IBOutlet weak var goButton:             UIButton!
    @IBOutlet weak var loginButton:          UIButton!
    @IBOutlet weak var textViewBackground:   UIView!
    @IBOutlet weak var textView:             UITextView!
    @IBOutlet weak var backButton:           UIBarButtonItem!
    @IBOutlet weak var shareButton:          UIBarButtonItem!
    @IBOutlet weak var shadowTextView:       UITextView!
    
    private var message = ""
    private let twoButtonsBack = #colorLiteral(red: 0.004247154575, green: 0.453612864, blue: 0.1538792849, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        systemBackground()
        goButtonsPrefering()wer
        textViewBackgroundPrefering()
        shadowTextViewPrefering()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6) {
            
            self.loginButton.alpha        = 1
            self.goButton.alpha           = 0.6
            self.textView.alpha           = 1
            self.textViewBackground.alpha = 1
        }
    }
    
    private func systemBackground() {
        textViewBackground.viewSystemBack()
        textView.viewSystemBack()
        view.viewSystemBack()
        
        textView.systemTextColor()
    }
    
    @IBAction func sharing(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: ["iBiology Login Screan"], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            activityVC.view.tintColor = lazyColor
        
            UIApplication.shared.keyWindow?.tintColor = lazyColor
        
        self.present(activityVC, animated: true, completion: nil)
        
        shareButton.shareAudio()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        authenticationWithTouchID()
    }
    
    private func goButtonsPrefering() {
        let backgroundColor     = twoButtonsBack
        let titleColor: UIColor = .white
        let corRadius: CGFloat  = 19
        let borderWidth = 3.68
        
        
        goButton.alpha      = 0.6
        goButton.isEnabled  = false
        goButton.alpha      = 0
        
        goButton.fastButtonCostomizing(background: backgroundColor, titleColor: titleColor, title: "Go", corner: Float(corRadius), borderWidth: Float(borderWidth))
        loginButton.fastButtonCostomizing(background: backgroundColor, titleColor: titleColor, title: "Login", corner: Float(corRadius), borderWidth: Float(borderWidth))
        
        loginButton.alpha = 0
        
    }
    
    private func shadowTextViewPrefering() {
        shadowTextView.textViewShadow()
    }
    
    private func textViewBackgroundPrefering() {
        textView.bigContentTextViewsPrefering(size: 21)
        textView.textViewShadow()
        
        textViewBackground.alpha                = 0
        textViewBackground.layer.cornerRadius   = CGFloat(cornerRadius)
        
        textViewBackground.viewShadows()
    }
    
    private func authenticationWithTouchID() {
        let localAuthenticationContext = LAContext()
            localAuthenticationContext.localizedFallbackTitle = "Use Passcode"
        
        var authError: NSError?
        let reasonString = "To access the secure data"
        
        if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
            
            localAuthenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString) { success, evaluateError in
                
                if success {
                    DispatchQueue.main.async {
                        self.goButton.isEnabled     = true
                        self.goButton.alpha         = 1
                        self.goButton.setTitle("Let's Go", for: .normal)
                        
                        self.loginButton.pulsate()
                        self.goButton.pulsate()
                        
                        self.loginButton.isEnabled  = true
                        self.loginButton.alpha      = 0.6
                        self.textView.text          = """
                        Good. "Go Button" is enabled.
                        """
                        
                        print("Success :) !!!")
                        
                        AudioServicesPlayAlertSound(SystemSoundID(1001))
                    }
                } else {
                    DispatchQueue.main.async {
                        self.textView.text = "Error. Please, try again."
                        
                        self.loginButton.shake(horizantaly: 4, Verticaly: 4)
                        self.goButton.shake(horizantaly: 4, Verticaly: 4)
                        
                        self.goButton.setTitle("Error", for: .normal)
                        
                        AudioServicesPlayAlertSound(SystemSoundID(1033))
                    }
                    
                    guard let error = evaluateError else {
                        return
                    }
                    
                    print(self.evaluateAuthenticationPolicyMessageForLA(errorCode: error._code))
                    //MARK: If you have choosen the 'Fallback authentication mechanism selected' (LAError.userFallback). Handle gracefully
                }
            }
        } else {
            guard let error = authError else {
                return
            }
            //MARK: Show appropriate alert if biometry/TouchID/FaceID is lockout or not enrolled
            print(self.evaluateAuthenticationPolicyMessageForLA(errorCode: error.code))
            
            AudioServicesPlayAlertSound(SystemSoundID(1033))
        }
    }
    
    func evaluatePolicyFailErrorMessageForLA(errorCode: Int) -> String {
        
        if #available(iOS 11.0, macOS 10.13, *) {
            switch errorCode {
            case LAError.biometryNotAvailable.rawValue:
                message = "Authentication could not start because the device does not support biometric authentication."
            case LAError.biometryLockout.rawValue:
                message = "Authentication could not continue because the user has been locked out of biometric authentication, due to failing authentication too many times."
            case LAError.biometryNotEnrolled.rawValue:
                message = "Authentication could not start because the user has not enrolled in biometric authentication."
            default:
                message = "Did not find error code on LAError object"
            }
        } else {
            switch errorCode {
            case LAError.touchIDLockout.rawValue:
                message = "Too many failed attempts."
                
            case LAError.touchIDNotAvailable.rawValue:
                message = "TouchID is not available on the device"
                
            case LAError.touchIDNotEnrolled.rawValue:
                message = "TouchID is not enrolled on the device"
                
            default:
                message = "Did not find error code on LAError object"
            }
        }
        return message
    }
    
     private func evaluateAuthenticationPolicyMessageForLA(errorCode: Int) -> String {
        
        switch errorCode {
            
        case LAError.authenticationFailed.rawValue:
            message = "The user failed to provide valid credentials"
            
        case LAError.appCancel.rawValue:
            message = "Authentication was cancelled by application"
            
        case LAError.invalidContext.rawValue:
            message = "The context is invalid"
            
        case LAError.notInteractive.rawValue:
            message = "Not interactive"
            
        case LAError.passcodeNotSet.rawValue:
            message = "Passcode is not set on the device"
            
        case LAError.systemCancel.rawValue:
            message = "Authentication was cancelled by the system"
            
        case LAError.userCancel.rawValue:
            message = "The user did cancel"
            
        case LAError.userFallback.rawValue:
            message = "The user chose to use the fallback"
            
        default:
            message = evaluatePolicyFailErrorMessageForLA(errorCode: errorCode)
        }
        return message
    }
}
