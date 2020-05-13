//
//  ArticlesOnlineVideosViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 02.11.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

class ArticlesOnlineVideosViewController: UIViewController {

    @IBOutlet weak var shareURl:              UIBarButtonItem!
    @IBOutlet weak var leftButton:            UIBarButtonItem!
    @IBOutlet weak var rightButton:           UIBarButtonItem!
    @IBOutlet weak var webViewBackground:     UIView!
    @IBOutlet weak var webView:               UIWebView!
    @IBOutlet weak var reloadButton:          UIBarButtonItem!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkingProccesesPrefering()
        viewBasicProccesesPrefering()
        
        articleVCProperty_NavBarHiddenSet()
    }
        
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.6) {
            let alpha = 1
            
            self.webViewBackground.alpha = CGFloat(alpha)
            self.webView.alpha           = CGFloat(alpha)
                
            UIView.animate(withDuration: 5) {
                let enabled = true
                
                self.shareURl.isEnabled     = enabled
                self.leftButton.isEnabled   = enabled
                self.rightButton.isEnabled  = enabled
                self.reloadButton.isEnabled = enabled
            }
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
        
    private func basicAlpha() {
        let alpha   = 0
        let enabled = false
        
        webViewBackground.alpha = CGFloat(alpha)
        webView.alpha           = CGFloat(alpha)
            
        shareURl.isEnabled     = enabled
        leftButton.isEnabled   = enabled
        rightButton.isEnabled  = enabled
        reloadButton.isEnabled = enabled
    }
        
    private func webViewBackgroundPrefering() {
        if #available(iOS 13.0, *) {
            webViewBackground.backgroundColor = .systemBackground
        }
        
        webViewBackground.layer.cornerRadius = CGFloat(20)
        webViewBackground.viewShadows()
        
        webViewPrefering()
    }
        
    private func webViewPrefering() {
        webView.layer.cornerRadius = 20
    }
        
    private func viewPrefering() {
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
            navigationController?.navigationBar.barTintColor = .systemBackground
        }
    }
        
    private func urlGiven() {
        guard navigationItem.title != nil else { return }
        
        if navigationItem.title == "Plants Videos" {
            self.webView.loadRequest(URLRequest(url: URL(string: ArticlesVideosURLs.plantsURL)!))
            
        } else if navigationItem.title == "Animals Videos" {
            
            self.webView.loadRequest(URLRequest(url: URL(string: ArticlesVideosURLs.animalURL)!))
        } else if navigationItem.title == "Microbes Videos" {
            
            self.webView.loadRequest(URLRequest(url: URL(string: ArticlesVideosURLs.microbeURL)!))
        } else if navigationItem.title == "Viruses Videos" {
            
            self.webView.loadRequest(URLRequest(url: URL(string: ArticlesVideosURLs.virusURL)!))
        } else if navigationItem.title == "Funguses Videos" {
            
            self.webView.loadRequest(URLRequest(url: URL(string: ArticlesVideosURLs.fungusURL)!))
        } else if navigationItem.title == "Archaea Videos" {
            
            self.webView.loadRequest(URLRequest(url: URL(string: ArticlesVideosURLs.archaeaURL)!))
        } else if navigationItem.title == "Humen Videos" {
            
            self.webView.loadRequest(URLRequest(url: URL(string: ArticlesVideosURLs.humanURL)!))
        } else if navigationItem.title == "Plants Images" {
                   
            self.webView.loadRequest(URLRequest(url: URL(string: ArticlesImagesURLs.plantsImagesURL)!))
        } else if navigationItem.title == "Animals Images" {
            
            self.webView.loadRequest(URLRequest(url: URL(string: ArticlesImagesURLs.animalImagesURL)!))
        } else if navigationItem.title == "Microbes Images" {
            
            self.webView.loadRequest(URLRequest(url: URL(string: ArticlesImagesURLs.microbeImagesURL)!))
        } else if navigationItem.title == "Viruses Images" {
            
            self.webView.loadRequest(URLRequest(url: URL(string: ArticlesImagesURLs.virusImagesURL)!))
        } else if navigationItem.title == "Funguses Images" {
            
            self.webView.loadRequest(URLRequest(url: URL(string: ArticlesImagesURLs.fungusImagesURL)!))
        } else if navigationItem.title == "Archaea Images" {
            
            self.webView.loadRequest(URLRequest(url: URL(string: (ArticlesImagesURLs.archaeaImagesURL))!))
        } else if navigationItem.title == "Humen Images" {
            
            self.webView.loadRequest(URLRequest(url: URL(string: ArticlesImagesURLs.humanImagesURL)!))
        }
    }
    
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
    
    private func fastActivityVC(content: String) {
        let activityVC = UIActivityViewController(activityItems: [content], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        
            UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        self.present(activityVC, animated: true, completion: nil)
    }
}
