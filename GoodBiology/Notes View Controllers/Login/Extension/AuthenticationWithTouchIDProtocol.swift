//
//  AuthenticationWithTouchIDProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 28.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import AuthenticationServices
import LocalAuthentication
import AudioToolbox

protocol AuthenticationWithTouchIDProtocol {
    func authenticationWithTouchID()
    func evaluatePolicyFailErrorMessageForLA(errorCode: Int) -> String
    func evaluateAuthenticationPolicyMessageForLA(errorCode: Int) -> String
}

extension LoginViewController: AuthenticationWithTouchIDProtocol {
    func authenticationWithTouchID() {
        let localAuthenticationContext = LAContext()
            localAuthenticationContext.localizedFallbackTitle = "Use Passcode"
        
        var authError: NSError?
        let reasonString = "To access the secure data"
        
        if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {

            localAuthenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString) { success, evaluateError in
                
                if success {
                    DispatchQueue.main.async {
                        let authenticationViewModel = AuthenticationWithTouchIDViewModel()
                        
                        authenticationViewModel.setupSucsessVariant(loginButton: self.loginButton, goButton: self.goButton)
                        AudioServicesPlayAlertSound(SystemSoundID(1001))
                    }
                } else {
                    DispatchQueue.main.async {
                        let authenticationViewModel = AuthenticationWithTouchIDViewModel()
                        
                        authenticationViewModel.setupFaildVariant(loginButton: self.loginButton, goButton: self.goButton)
                        
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
    
    func evaluateAuthenticationPolicyMessageForLA(errorCode: Int) -> String {
        
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

class AuthenticationWithTouchIDViewModel {
    func setupSucsessVariant(loginButton: UIButton, goButton: UIButton) {
        goButton.isEnabled     = true
        goButton.alpha         = 1
        goButton.setTitle("Let's Go", for: .normal)
        
        loginButton.pulsate()
        goButton.pulsate()
        
        loginButton.isEnabled  = true
        loginButton.alpha      = 0.6
    }
    
    func setupFaildVariant(loginButton: UIButton, goButton: UIButton) {
        loginButton.shake(horizantaly: 4, Verticaly: 4)
        goButton.shake(horizantaly: 4, Verticaly: 4)
        
        goButton.setTitle("Error", for: .normal)
    }
}