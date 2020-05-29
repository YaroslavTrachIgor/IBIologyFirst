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


//MARK: Main Class
final class LoginViewController: UIViewController {
    
    //MARK: - @IBOutlets
    // UIButtons
    @IBOutlet weak var useLoginWithTouch:   UIButton!
    @IBOutlet weak var signInWithApple:     UIButton!
    @IBOutlet weak var emailButton:         UIButton!
    
    // UIBarButtonItem
    @IBOutlet weak var logOutButton: UIBarButtonItem!
    
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
    
    //MARK: appleSignInButton
    @IBOutlet weak var appleSignInButton: BasicASAuthorizationAppleIDButton!
    
    // String Message
    lazy var message = {
        return ""
    }()
    
    
    //MARK: - Private
    private let twoButtonsBack: UIColor = .biologyGreenColor
    
    //UserDefaults
    private var defaults = UserDefaults.standard
    
    
    //MARK: - Fileprivate
    fileprivate var useSignInWithApple:   Bool = false
    fileprivate var useSignInWithTouchID: Bool = false
    
    
    //MARK: - VCKeys
    struct VCKeys {
        
        // Key for this VC
        static let goButtonKey = Notification.Name(rawValue: LoginViewControllerKeys.goButtonKey)
    }
    
    
    //MARK: ViewModel
    let viewModel = LoginViewControllerViewModel()
    
    
    //MARK: AppleButtonSettings
    var appleButton = AppleButtonSettings()
    
    
    //MARK: - Overrides
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
        
        setupViewDidApearAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mainVC = segue.destination as? ForTodayViewController, let user = sender as? User {
            mainVC.user = user
        }
    }
}



//MARK: - @IBActions
extension LoginViewController {
    @IBAction func loginButton(_ sender: Any) {
        authenticationWithTouchID()
        
        /// For Analytics
        AnalyticsManeger.addLoginOptionsAnalytics(for: "TouchID")
    }
    
    @IBAction func signInWithEmail(_ sender: Any) {
        setupLoginWithEmail()
        
        /// For Analytics
        AnalyticsManeger.addLoginOptionsAnalytics(for: "Email")
    }
    
    @IBAction func googleSignOut(_ sender: UIBarButtonItem) {
        setupLogOut()
        
        /// Setup standart goButton
        uiLogOut()
    }
}



//MARK: - Setup Google Sign In
extension LoginViewController {
    func setupGoogleSignInButton() {
        GIDSignIn.sharedInstance()?.presentingViewController = navigationController
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
}



//MARK: - Setup AppleButton
extension LoginViewController {
    @objc func didTapAppleButton() {
        let provider = ASAuthorizationAppleIDProvider()
        let request  = provider.createRequest()
        
        DispatchQueue.global(qos: .userInteractive).async {
            self.viewModel.setupAuthorizationAppleIDRequest(request: request)
            
            let controller = BasicASAuthorizationController(authorizationRequests: [request])
            
            controller.delegate = self
            controller.presentationContextProvider = self
        }
        
        /// For Analytics
        AnalyticsManeger.addLoginOptionsAnalytics(for: "Apple")
    }
}



//MARK: - Setup NavigationController
extension LoginViewController {
    func setupNavController() {
        viewModel.setupNavController(navigationController!)
    }
}
