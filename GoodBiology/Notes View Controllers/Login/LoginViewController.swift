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
import FirebaseUI
import FirebaseAuth

// Key for Post
struct LoginViewControllerKeys {
    static let goButtonKey = "goButtonKey"
}

@available(iOS 13.0, *)
class LoginViewController: UIViewController {
    
    // UIButtons
    @IBOutlet weak var useLoginWithTouch:   UIButton!
    @IBOutlet weak var signInWithApple:     UIButton!
    @IBOutlet weak var emailButton:         UIButton!
    
    private var defaults = UserDefaults.standard
    
    fileprivate var useSignInWithApple:   Bool = false
    fileprivate var useSignInWithTouchID: Bool = false
    
    struct Keys {
        fileprivate static let appleViewHiddenKey              = "AppleViewHidden"
        fileprivate static let loginButtonHiddenKey            = "LoginButtonHidden"
        fileprivate static let goButtonHiddenKey               = "AppleViewHidden"
        fileprivate static let hideAppleViewButtonHiddenKey    = "LoginButtonHidden"
    }
    
    // Skip Button
    @IBOutlet weak var skipButton: SkipButton!
    
    // Google Sign In Button
    @IBOutlet weak var googleSignInButton:     BasicGoogleSignInButton!
    @IBOutlet weak var costomGoogleSignInView: CostomGoogleSignInButtonView!
    
    // Login Buttons
    @IBOutlet weak var goButton:    UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signInIconImage: SignInIconImage!
    
    // UIBarButtonItems
    @IBOutlet weak var backButton:  UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    // THis Green Decoration Thing
    @IBOutlet weak var loginBackView:       LoginViewControllerBackView!
    @IBOutlet weak var loginIcaonImageView: UIImageView!
    @IBOutlet weak var emailIcon:           UIImageView!
    
    // String Message
    lazy var message = {
        return ""
    }()
    private let twoButtonsBack: UIColor = .biologyGreenColor
    
    struct VCKeys {
        
        // Key for this VC
        static let goButtonKey = Notification.Name(rawValue: LoginViewControllerKeys.goButtonKey)
    }
    
    //MARK: ViewModel
    let viewModel = LoginViewControllerViewModel()
    
    //MARK: appleSignInButton
    @IBOutlet weak var appleSignInButton: BasicASAuthorizationAppleIDButton!
    
    //MARK: AppleButtonSettings
    var appleButton = AppleButtonSettings()
    
    // UIBarButtonItem
    @IBOutlet weak var logOutButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        systemBackground()
        buttonsSetup()
        setupGoogleSignInButton()
        setupAppleSignInButton()
        setupGoogleSignIndDelegate()
    }

    override func viewWillLayoutSubviews() {
        view.setupBasicGadientView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6) {
            let alpha: CGFloat = 1
            
            self.loginButton.alpha        = alpha
            self.goButton.alpha           = 0.6
        }
        setupNavController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
    }
    
    @IBAction func loginButton(_ sender: Any) {
        authenticationWithTouchID()
    }
    
    @IBAction func signInWithEmail(_ sender: Any) {
        let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else { return }
        authUI?.delegate = self
        let authVC = authUI!.authViewController()
        present(authVC, animated: true)
    }
    
    @IBAction func googleSignOut(_ sender: UIBarButtonItem) {
        GIDSignIn.sharedInstance()?.signOut()
        
        if goButton.backgroundColor == .costomGoogleColor {
            FastAlert.showBasic(title: "Operation complete", message: "You are logged out of your Google account.", vc: self)
        } else {
            FastAlert.showBasic(title: errorWord, message: "You did not enter your Google account", vc: self)
        }
        
        /// Setup standart goButton
        uiLogOut()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mainVC = segue.destination as? ForTodayViewController, let user = sender as? User {
            mainVC.user = user
        }
    }
}

// Setup Google Sign In
@available(iOS 13.0, *)
extension LoginViewController {
    func setupGoogleSignInButton() {
        GIDSignIn.sharedInstance()?.presentingViewController = navigationController
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
}

@available(iOS 13.0, *)
extension LoginViewController {
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
}

@available(iOS 13.0, *)
extension LoginViewController {
    func setupNavController() {
        viewModel.setupNavController(navigationController!)
    }
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        guard error != nil else {
            return
        }
        performSegue(withIdentifier: "segue", sender: self)
    }
}
