//
//  LoginViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 2/17/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import LocalAuthentication
import AudioToolbox
import AuthenticationServices
import GoogleSignIn

@available(iOS 13.2, *)
class LoginViewController: UIViewController {
    
    // Edit Button
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    // Edit Back View
    @IBOutlet weak var editBackView: ContentBack! 
    
    // UIButtons
    @IBOutlet weak var useLoginWithTouch:   UIButton!
    @IBOutlet weak var signInWithApple:     UIButton!
    
    private var defaults = UserDefaults.standard
    
    fileprivate var useSignInWithApple:   Bool = false
    fileprivate var useSignInWithTouchID: Bool = false
    
    struct Keys {
        fileprivate static let appleViewHiddenKey              = "AppleViewHidden"
        fileprivate static let loginButtonHiddenKey            = "LoginButtonHidden"
        fileprivate static let goButtonHiddenKey               = "AppleViewHidden"
        fileprivate static let hideAppleViewButtonHiddenKey    = "LoginButtonHidden"
    }
    
    // Login Buttons
    @IBOutlet weak var goButton:    UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    // Content
    @IBOutlet weak var textViewBackground:   ContentBack!
    @IBOutlet weak var textView:             UITextView!
    
    // UIBarButtonItems
    @IBOutlet weak var backButton:  UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    // Sign In With Apple
    @IBOutlet weak var shadowTextView:       UITextView!
    @IBOutlet weak var hideSignInWithAppleButton: UIButton!
    @IBOutlet weak var appleView:          UIView!
    
    // String Message
    private var message: String = ""
    private let twoButtonsBack = lazyColor
    
    var appleButton = AppleButtonSettings()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        systemBackground()
        goButtonsPrefering()
        textViewBackgroundPrefering()
        shadowTextViewPrefering()
        setupAppleButton()
        checkForSaved()
        setupGoogleSignInButton()
    }
    
    func checkForSaved() {
        func viewSetForCheckForSaved(view: UIView, key: String) {
            if let key = defaults.object(forKey: key) {
                view.isHidden = key as! Bool
            }
        }
        
        viewSetForCheckForSaved(view: appleView,
                                key: Keys.appleViewHiddenKey)
        viewSetForCheckForSaved(view: loginButton,
                                key: Keys.loginButtonHiddenKey)
        viewSetForCheckForSaved(view: hideSignInWithAppleButton,
                                key: Keys.hideAppleViewButtonHiddenKey)
    }
    
    func setupGoogleSignInButton() {
        let signInButton = GIDSignInButton(frame: CGRect(x: 7, y: 130, width: 386, height: 50))
        
        appleView.addSubview(signInButton)
        
        GIDSignIn.sharedInstance()?.presentingViewController = navigationController
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6) {
            let alpha: CGFloat = 1
            
            self.loginButton.alpha        = alpha
            self.goButton.alpha           = 0.6
            self.textView.alpha           = alpha
            self.textViewBackground.alpha = alpha
        }
    }
    
    private func setupAppleButton() {
        let appleButton = ASAuthorizationAppleIDButton(type: .default, style: .black)
        
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        appleButton.isHidden                                  = false
        
        appleButton.addTarget(self, action: #selector(didTapAppleButton), for: .touchUpInside)
        
        appleButton.viewShadows()
        appleButton.layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        appleButton.cornerRadius = 9

        appleView.addSubview(appleButton)
        
        NSLayoutConstraint.activate([
            appleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            appleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            appleButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -25)
        ])
        
        appleView.viewShadows()
        appleView.layer.cornerRadius = cornerRadius
    }
    
    @objc func didTapAppleButton() {
        let provider = ASAuthorizationAppleIDProvider()
        let request  = provider.createRequest()
        
        DispatchQueue.global(qos: .userInteractive).async {
            request.requestedScopes = [.fullName, .email]
            
            let controller = BasicASAuthorizationController(authorizationRequests: [request])
            
            controller.delegate = self
            controller.presentationContextProvider = self
        }
    }
    
    @IBAction func hideAppleView(_ sender: Any) {
        appleView.isHidden = true
    }
    
    private func systemBackground() {
        view.viewSystemBack()
        
        textView.viewSystemBack()
        textView.systemTextColor()
    }
    
    @IBAction func useLoginWithApple(_ sender: Any) {
        let hidden = true
        
        appleView.isHidden                  = !hidden
        hideSignInWithAppleButton.isHidden  = hidden
        
        loginButton.isHidden = hidden
        goButton.isHidden    = hidden
        
        defaultsSet()
    }
    
    @IBAction func editButton(_ sender: Any) {
        if editBackView.isHidden == true {
            editBackView.isHidden = false
        } else {
            editBackView.isHidden = true
        }
    }
    
    @IBAction func useLoginWithTouch(_ sender: Any) {
        let hidden = true
        
        appleView.isHidden = hidden
        
        loginButton.isHidden = !hidden
        goButton.isHidden    = !hidden
        
        defaultsSet()
    }
    
    private func defaultsSet() {
        defaults.set(appleView.isHidden, forKey: Keys.appleViewHiddenKey)
        defaults.set(hideSignInWithAppleButton.isHidden, forKey: Keys.hideAppleViewButtonHiddenKey)
        defaults.set(loginButton.isHidden, forKey: Keys.loginButtonHiddenKey)
    }
    
    @IBAction func sharing(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: ["iBiology Login Screan"], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            UIApplication.shared.keyWindow?.tintColor = lazyColor
        
        self.present(activityVC, animated: true, completion: nil)
        
        shareButton.shareAudio()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        authenticationWithTouchID()
    }
    
    private func goButtonsPrefering() {
        goButton.alpha      = 0.9
        goButton.isEnabled  = false
        goButton.alpha      = 0
        
        goButton.setTitleColor(appleButton.titleColor, for: .normal)
        goButton.backgroundColor = appleButton.backgroundColor
        goButton.layer.cornerRadius = appleButton.appleButtonCornerRadius
        goButton.titleLabel?.font = appleButton.font
        goButton.setTitle("Continue", for: .normal)
        
        loginButton.setTitleColor(appleButton.titleColor, for: .normal)
        loginButton.backgroundColor = appleButton.backgroundColor
        loginButton.layer.cornerRadius = appleButton.appleButtonCornerRadius
        loginButton.titleLabel?.font = appleButton.font
        loginButton.setTitle("Sign In", for: .normal)
        loginButton.alpha = 0
    }
    
    private func shadowTextViewPrefering() {
        shadowTextView.textViewShadow()
    }
    
    private func textViewBackgroundPrefering() {
        textViewSetup()
        textViewBackgroundSetup()
    }
    
    private func textViewSetup() {
        textView.bigContentTextViewsPrefering(size: 21)
        textView.textViewShadow()
    }
    
    private func textViewBackgroundSetup() {
        textViewBackground.alpha                = 0
        textViewBackground.layer.cornerRadius   = CGFloat(cornerRadius)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mainVC = segue.destination as? ForTodayViewController, let user = sender as? User {
            mainVC.user = user
        }
    }
}

@available(iOS 13.2, *)
extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
}

@available(iOS 13.2, *)
extension LoginViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Error", error)
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        DispatchQueue.global(qos: .utility).async {
            DispatchQueue.main.async {
                switch authorization.credential {
                case let credentials as ASAuthorizationAppleIDCredential:
                    let user = User(credentials: credentials)
                    self.performSegue(withIdentifier: "segue", sender: user)
                default:
                    break
                }
            }
        }
    }
}
