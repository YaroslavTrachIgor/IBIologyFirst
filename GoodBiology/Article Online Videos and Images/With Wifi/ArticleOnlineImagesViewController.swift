//
//  ArticleOnlineVideoViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 06.09.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import WebKit

protocol ArticleOnlineVCsSetupProtocol {
    func share(_ sender: Any)
    func urlGiven()
    func viewDidApearAnimationSetup()
}

class ArticleOnlineImagesViewController: UIViewController {
    
    //MARK: @IBOutlet
    @IBOutlet weak var shareURl:              UIBarButtonItem!
    @IBOutlet weak var leftButton:            UIBarButtonItem!
    @IBOutlet weak var rightButton:           UIBarButtonItem!
    @IBOutlet weak var webViewBackground:     UIView!
    @IBOutlet weak var webView:               WKWebView!
    @IBOutlet weak var reloadButton:          UIBarButtonItem!
    
    //MARK: override
    override func viewDidLoad() {
        super.viewDidLoad()

        networkingProccesesPrefering()
        viewBasicProccesesPrefering()
        articleVCProperty_NavBarHiddenSet()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewDidApearAnimationSetup()
    }
}

// MARK: - Actions
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
}

// MARK: - Main Functions
extension ArticleOnlineImagesViewController {
    
    // MARK: - Private
    private func basicAlpha() {
        let alpha: CGFloat = 0
        let enabled: Bool = false
        
        /// Set alpha
        webViewBackground.alpha = alpha
        webView.alpha           = alpha
        
        /// set enabled
        shareURl.isEnabled     = enabled
        leftButton.isEnabled   = enabled
        rightButton.isEnabled  = enabled
        reloadButton.isEnabled = enabled
    }
    
    private func webViewBackgroundPrefering() {
        
        /// webViewBackground setup
        webViewBackground.backgroundColor = .systemBackground
        webViewBackground.layer.cornerRadius = CGFloat(20)
        webViewBackground.viewShadows()
        
        /// webView setup
        webView.layer.cornerRadius = 20
    }
    
    private func viewPrefering() {
        
        /// views backgroundColors setup
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.barTintColor = .systemBackground
    }
    
    private func fastActivityVC(item: String) {
        let activityVC = UIActivityViewController(activityItems: [item], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        
            UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        self.present(activityVC, animated: true, completion: nil)
    }
}

// MARK: - WebControllerDelegate
extension ArticleOnlineImagesViewController: WebControllerDelegate {
    func checkWifi() {
        let networkStatus = Reachability().connectionStatus()
        switch networkStatus {
        case .Unknown, .Offline:
            print("Offline")
            FastAlert.showBasic(title: "Oops", message: "You are not connected to WiFi", vc: self)
        case .Online(.WWAN):
            print("Connected via WWAN")
        case .Online(.WiFi):
            print("Connected via WiFi")
        }
    }
    
    func networkingProccesesPrefering() {
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            DispatchQueue.main.async {
                self.urlGiven()
            }
        }
    }
    
    func viewBasicProccesesPrefering() {
        webViewBackgroundPrefering()
        basicAlpha()
    }
}

extension ArticleOnlineImagesViewController: ArticleOnlineVCsSetupProtocol {
    func viewDidApearAnimationSetup() {
        UIView.animate(withDuration: 0.6) {
            let alpha: CGFloat = 1
            
            self.webViewBackground.alpha = alpha
            self.webView.alpha           = alpha
            
            UIView.animate(withDuration: 5) {
                let enabled = true
                
                self.shareURl.isEnabled     = enabled
                self.leftButton.isEnabled   = enabled
                self.rightButton.isEnabled  = enabled
                self.reloadButton.isEnabled = enabled
            }
        }
    }
    
    func urlGiven() {
        /// guard
        guard title != nil else { return }
        
        func webViewLoad(url string: String) {
            webView.load(URLRequest(url: URL(string: string)!))
        }
        
        //MARK: Set webView URL
        if title == "Plants Videos" {
            webViewLoad(url: ArticlesVideosURLs.plantsURL)
            
        } else if title == "Animals Videos" {
            webViewLoad(url: ArticlesVideosURLs.animalURL)
            
        } else if title == "Microbes Videos" {
            webViewLoad(url: ArticlesVideosURLs.microbeURL)
            
        } else if title == "Viruses Videos" {
            webViewLoad(url: ArticlesVideosURLs.virusURL)
            
        } else if title == "Funguses Videos" {
            webViewLoad(url: ArticlesVideosURLs.fungusURL)
            
        } else if title == "Archaea Videos" {
            webViewLoad(url: ArticlesVideosURLs.archaeaURL)
            
        } else if title == "Humen Videos" {
            webViewLoad(url: ArticlesVideosURLs.humanURL)
            
        } else if title == "Plants Images" {
            webViewLoad(url: ArticlesImagesURLs.plantsImagesURL)
            
        } else if title == "Animals Images" {
            webViewLoad(url: ArticlesImagesURLs.animalImagesURL)

        } else if title == "Microbes Images" {
            webViewLoad(url: ArticlesImagesURLs.microbeImagesURL)
            
        } else if title == "Viruses Images" {
            webViewLoad(url: ArticlesImagesURLs.virusImagesURL)
            
        } else if title == "Funguses Images" {
            webViewLoad(url: ArticlesImagesURLs.fungusImagesURL)
            
        } else if title == "Archaea Images" {
            webViewLoad(url: ArticlesImagesURLs.archaeaImagesURL)
            
        } else if title == "Humen Images" {
            webViewLoad(url: ArticlesImagesURLs.humanImagesURL)
        }
    }
    
    // MARK: @IBAction
    @IBAction func share(_ sender: Any) {
        guard navigationItem.title != nil, let url = webView?.url!.absoluteString else { return }
        fastActivityVC(item: url)
    }
}
