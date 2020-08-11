//
//  ArticleOnlineVideoViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 06.09.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import WebKit

//MARK: - Main ArticleOnlineImagesViewController class
final class ArticleOnlineImagesViewController: UIViewController {
    
    //MARK: @IBOutlets
    @IBOutlet weak var shareURl: UIBarButtonItem!
    @IBOutlet weak var leftButton: UIBarButtonItem!
    @IBOutlet weak var rightButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    @IBOutlet weak var webViewBackground: UIView!
    @IBOutlet weak var webView: WKWebView!
    
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        networkingProccesesPrefering()
        viewBasicProccesesPrefering()
        articleVCProperty_NavBarHiddenSet()
        setuoNavController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewDidApearAnimationSetup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        ///Set basic navBar title color
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
}



//MARK: - @IBActions
extension ArticleOnlineImagesViewController {
    @IBAction func goForwardAction(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }

    @IBAction func goBackButton(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func reload(_ sender: Any) {
        webView.reload()
    }
    
    @IBAction func share(_ sender: Any) {
        guard navigationItem.title != nil, let url = webView?.url!.absoluteString else { return }
        fastActivityVC(item: url)
    }
}



//MARK: - Main Functions
extension ArticleOnlineImagesViewController {
    
    //MARK: Private
    private func basicAlpha() {
        
        /// Set alpha
        let views: [UIView] = [webViewBackground, webView]
        for view in views {
            view.alpha = 0
        }
        
        /// set enabled
        let buttons: [UIBarButtonItem] = [shareURl, leftButton, rightButton, reloadButton]
        for button in buttons {
            button.isEnabled = false
        }
    }
    
    private func webViewBackgroundPrefering() {
        webViewBackground.backgroundColor = .systemBackground
        webViewBackground.layer.cornerRadius = 20
        webViewBackground.viewShadows()
        webView.layer.cornerRadius = 20
    }
    
    private func fastActivityVC(item: String) {
        
        /// Setup UIActivityViewController
        let activityVC = UIActivityViewController(activityItems: [item], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    private func setuoNavController() {
        
        /// Setup navigationController
        let navController = navigationController
        navController?.hidesBarsOnTap = false
        navController?.hidesBarsOnSwipe = false
        
        ///Setup titles colors
        setupNavBarColors()
    }
    
    private func setupNavBarColors() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}



//MARK: - WebControllerDelegate extension
extension ArticleOnlineImagesViewController: WebControllerDelegate {
    internal func checkWifi() {
        let networkStatus = Reachability().connectionStatus()
        switch networkStatus {
            case .Unknown, .Offline:
                FastAlert.showBasic(title: "Oops", message: "You are not connected to WiFi", vc: self)
            case .Online(.WWAN): return
            case .Online(.WiFi): return
        }
    }
    
    internal func networkingProccesesPrefering() {
        let queue = DispatchQueue.global(qos: .userInteractive)
        queue.async {
            DispatchQueue.main.async {
                self.urlGiven()
            }
        }
    }
    
    internal func viewBasicProccesesPrefering() {
        webViewBackgroundPrefering()
        basicAlpha()
    }
}



//MARK: - ArticleOnlineVCsSetupProtocol extension
extension ArticleOnlineImagesViewController: ArticleOnlineVCsSetupProtocol {
    
    //MARK: Setup Animation for viewDidApear
    internal func viewDidApearAnimationSetup() {
        let views: [UIView] = [webViewBackground, webView]
        let buttons: [UIBarButtonItem] = [shareURl, leftButton, rightButton, reloadButton]
        
        /// Setup animation
        UIView.animate(withDuration: 0.6) {
            
            /// Set alpha
            for view in views {
                view.alpha = 1
            }
            
            UIView.animate(withDuration: 5) {
                /// set enabled
                for button in buttons {
                    button.isEnabled = true
                }
            }
        }
    }
    
    //MARK: Setup webView content
    internal func urlGiven() {
        
        //MARK: Title guard
        guard title != nil else { return }
        
        /// Fast webView load
        func webViewLoad(url string: String) {
            webView.load(URLRequest(url: URL(string: string)!))
        }
        
        //MARK: Set webView URL
        switch title {
        case "Plants Videos":
            webViewLoad(url: ArticlesVideosURLs.plantsURL)
        case "Animals Videos":
            webViewLoad(url: ArticlesVideosURLs.animalURL)
        case "Microbes Videos":
            webViewLoad(url: ArticlesVideosURLs.microbeURL)
        case "Viruses Videos":
            webViewLoad(url: ArticlesVideosURLs.virusURL)
        case "Funguses Videos":
            webViewLoad(url: ArticlesVideosURLs.fungusURL)
        case "Archaea Videos":
            webViewLoad(url: ArticlesVideosURLs.archaeaURL)
        case "Humen Videos":
            webViewLoad(url: ArticlesVideosURLs.humanURL)
        case "Plants Images":
            webViewLoad(url: ArticlesImagesURLs.plantsImagesURL)
        case "Animals Images":
            webViewLoad(url: ArticlesImagesURLs.animalImagesURL)
        case "Microbes Images":
            webViewLoad(url: ArticlesImagesURLs.microbeImagesURL)
        case "Viruses Images":
            webViewLoad(url: ArticlesImagesURLs.virusImagesURL)
        case "Funguses Images":
            webViewLoad(url: ArticlesImagesURLs.fungusImagesURL)
        case "Archaea Images":
            webViewLoad(url: ArticlesImagesURLs.archaeaImagesURL)
        case "Humen Images":
            webViewLoad(url: ArticlesImagesURLs.humanImagesURL)
        default:
            webViewLoad(url: ArticlesVideosURLs.plantsURL)
        }
    }
}
