//
//  ArticlesOnlineVideosViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 02.11.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import WebKit

//MARK: - Main ArticlesOnlineVideosViewController class
class ArticlesOnlineVideosViewController: UIViewController {

    //MARK: - @IBOutlets
    //MARK: UIBarButtonItems
    @IBOutlet weak var shareURl:     UIBarButtonItem!
    @IBOutlet weak var leftButton:   UIBarButtonItem!
    @IBOutlet weak var rightButton:  UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    
    //MARK: webViewBackground and webView
    @IBOutlet weak var webViewBackground: UIView!
    @IBOutlet weak var webView:           WKWebView!
        
    
    //MARK: - Overrides
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
}



// MARK: - Main Methods
extension ArticlesOnlineVideosViewController {
    
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
        
        /// Setup webViewBackground
        webViewBackground.backgroundColor = .systemBackground
        webViewBackground.layer.cornerRadius = CGFloat(20)
        webViewBackground.viewShadows()
        
        /// Setup webView
        webViewPrefering()
    }
        
    private func webViewPrefering() {
        webView.layer.cornerRadius = 20
    }
        
    private func viewPrefering() {
        let backColor: UIColor = .systemBackground
        
        view.backgroundColor                             = backColor
        navigationController?.navigationBar.barTintColor = backColor
    }
    
    private func setuoNavController() {
        
        /// Setup navigationController
        let navController = navigationController
        navController?.hidesBarsOnTap   = false
        navController?.hidesBarsOnSwipe = false
    }
    
    
    //MARK: Internal
    internal func fastActivityVC(content: String) {
        
        /// Setup UIActivityViewController
        let activityVC = UIActivityViewController(activityItems: [content], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
}



// MARK: - @IBActions
extension ArticlesOnlineVideosViewController {
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
        if navigationItem.title == "Plant Videos" {
            fastActivityVC(content: definitionData)
            
        } else if navigationItem.title == "Animals Videos" {
            fastActivityVC(content: algaeData)
            
        } else if navigationItem.title == "Microbes Videos" {
            fastActivityVC(content: fungiData)
            
        } else if navigationItem.title == "Viruses Videos" {
            fastActivityVC(content: diversityData)
            
        } else if navigationItem.title == "Funguses Videos" {
            fastActivityVC(content: evolutionData)
            
        } else if navigationItem.title == "Archaea Videos" {
            fastActivityVC(content: embryophytesData)
            
        } else if navigationItem.title == "Humen Videos" {
            fastActivityVC(content: embryophytesData)
            
        } else if navigationItem.title == "Plants Images" {
                          
            fastActivityVC(content: ArticlesImagesURLs.plantsImagesURL)
        } else if navigationItem.title == "Animals Images" {
                
            fastActivityVC(content: ArticlesImagesURLs.animalImagesURL)
        } else if navigationItem.title == "Microbes Images" {
                   
            fastActivityVC(content: ArticlesImagesURLs.microbeImagesURL)
        } else if navigationItem.title == "Viruses Images" {
                   
            fastActivityVC(content: ArticlesImagesURLs.virusImagesURL)
        } else if navigationItem.title == "Funguses Images" {
                   
            fastActivityVC(content: ArticlesImagesURLs.fungusImagesURL)
        } else if navigationItem.title == "Archaea Images" {
                   
            fastActivityVC(content: ArticlesImagesURLs.archaeaImagesURL)
        } else if navigationItem.title == "Humen Images" {
            
            fastActivityVC(content: ArticlesImagesURLs.humanImagesURL)
        }
    }
}



// MARK: - ArticleOnlineVCsSetupProtocol extension
extension ArticlesOnlineVideosViewController: ArticleOnlineVCsSetupProtocol {
    
    // MARK: Setup Animation for viewDidApear
    func viewDidApearAnimationSetup() {
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
    
    // MARK: Setup webView content
    func urlGiven() {
        
        //MARK: Title guard
        guard title != nil else { return }
        
        /// Fast webView load
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
}



// MARK: - WebControllerDelegate
extension ArticlesOnlineVideosViewController: WebControllerDelegate {
    func checkWifi() {
        let networkStatus = Reachability().connectionStatus()
        switch networkStatus {
            case .Unknown, .Offline:
                FastAlert.showBasic(title: "Oops", message: "You are not connected to WiFi", vc: self)
            case .Online(.WWAN): return
            case .Online(.WiFi): return
        }
    }
    
    func networkingProccesesPrefering() {
        let queue = DispatchQueue.global(qos: .userInteractive)
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
