//
//  ArticleOnlineVideoViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 06.09.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import WebKit

class ArticleOnlineImagesViewController: UIViewController, WebControllerDelegate {
    
    @IBOutlet weak var shareURl:              UIBarButtonItem!
    @IBOutlet weak var leftButton:            UIBarButtonItem!
    @IBOutlet weak var rightButton:           UIBarButtonItem!
    @IBOutlet weak var webViewBackground:     UIView!
    @IBOutlet weak var webView:               WKWebView!
    @IBOutlet weak var reloadButton:          UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        networkingProccesesPrefering()
        viewBasicProccesesPrefering()
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
        urlGiven()
    }
    
    func viewBasicProccesesPrefering() {
        webViewBackgroundPrefering()
        basicAlpha()
    }
    
    private func basicAlpha() {
        let alpha = 0
        let enabled: Bool = false
        
        webViewBackground.alpha = CGFloat(alpha)
        webView.alpha           = CGFloat(alpha)
        
        shareURl.isEnabled     = enabled
        leftButton.isEnabled   = enabled
        rightButton.isEnabled  = enabled
        reloadButton.isEnabled = enabled
        
    }
    
    private func webViewBackgroundPrefering() {
        cornerRadius = 20
        
        if #available(iOS 13.0, *) {
            webViewBackground.backgroundColor = .systemBackground
        }
        webViewBackground.layer.cornerRadius = CGFloat(cornerRadius)
        webViewBackground.viewShadows()
        
        webViewPrefering()
    }
    
    private func webViewPrefering() {
       cornerRadius = 20
        
       webView.layer.cornerRadius = CGFloat(cornerRadius)
    }
    
    private func viewPrefering() {
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
            navigationController?.navigationBar.barTintColor = .systemBackground
        }
    }
    
    private func urlGiven() {
        if navigationItem.title == "Plants Videos" {
            self.webView.load(URLRequest(url: URL(string: ArticlesVideosURLs.plantsURL)!))
        } else if navigationItem.title == "Animals Videos" {
            
            self.webView.load(URLRequest(url: URL(string: ArticlesVideosURLs.animalURL)!))
        } else if navigationItem.title == "Microbes Videos" {
            
            self.webView.load(URLRequest(url: URL(string: ArticlesVideosURLs.microbeURL)!))
        } else if navigationItem.title == "Viruses Videos" {
            
            self.webView.load(URLRequest(url: URL(string: ArticlesVideosURLs.virusURL)!))
        } else if navigationItem.title == "Funguses Videos" {
            
            self.webView.load(URLRequest(url: URL(string: ArticlesVideosURLs.fungusURL)!))
        } else if navigationItem.title == "Archaea Videos" {
            
            self.webView.load(URLRequest(url: URL(string: ArticlesVideosURLs.archaeaURL)!))
        } else if navigationItem.title == "Humen Videos" {
            
            self.webView.load(URLRequest(url: URL(string: ArticlesVideosURLs.humanURL)!))
        } else if navigationItem.title == "Plants Images" {
                   
            self.webView.load(URLRequest(url: URL(string: ArticlesImagesURLs.plantsImagesURL)!))
        } else if navigationItem.title == "Animals Images" {
            
            self.webView.load(URLRequest(url: URL(string: ArticlesImagesURLs.animalImagesURL)!))
        } else if navigationItem.title == "Microbes Images" {
            
            self.webView.load(URLRequest(url: URL(string: ArticlesImagesURLs.microbeImagesURL)!))
        } else if navigationItem.title == "Viruses Images" {
            
            self.webView.load(URLRequest(url: URL(string: ArticlesImagesURLs.virusImagesURL)!))
        } else if navigationItem.title == "Funguses Images" {
            
            self.webView.load(URLRequest(url: URL(string: ArticlesImagesURLs.fungusImagesURL)!))
        } else if navigationItem.title == "Archaea Images" {
            
            self.webView.load(URLRequest(url: URL(string: (ArticlesImagesURLs.archaeaImagesURL))!))
        } else if navigationItem.title == "Humen Images" {
            
            self.webView.load(URLRequest(url: URL(string: ArticlesImagesURLs.humanImagesURL)!))
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
            fastActivityVC(item: definitionData)
            
        } else if navigationItem.title == "Animals Videos" {
            fastActivityVC(item: algaeData)
            
        } else if navigationItem.title == "Microbes Videos" {
            fastActivityVC(item: fungiData)
            
        } else if navigationItem.title == "Viruses Videos" {
            fastActivityVC(item: diversityData)
            
        } else if navigationItem.title == "Funguses Videos" {
            fastActivityVC(item: evolutionData)
            
        } else if navigationItem.title == "Archaea Videos" {
            fastActivityVC(item: embryophytesData)
            
        } else if navigationItem.title == "Humen Videos" {
            fastActivityVC(item: embryophytesData)
            
        } else if navigationItem.title == "Plants Images" {
                          
            fastActivityVC(item: ArticlesImagesURLs.plantsImagesURL)
        } else if navigationItem.title == "Animals Images" {
            
            fastActivityVC(item: ArticlesImagesURLs.animalImagesURL)
        } else if navigationItem.title == "Microbes Images" {
            
             fastActivityVC(item: ArticlesImagesURLs.microbeImagesURL)
        } else if navigationItem.title == "Viruses Images" {
            
            fastActivityVC(item: ArticlesImagesURLs.virusImagesURL)
        } else if navigationItem.title == "Funguses Images" {
            
            fastActivityVC(item: ArticlesImagesURLs.fungusImagesURL)
        } else if navigationItem.title == "Archaea Images" {
            
            fastActivityVC(item: ArticlesImagesURLs.archaeaImagesURL)
        } else if navigationItem.title == "Humen Images" {
            
            fastActivityVC(item: ArticlesImagesURLs.humanImagesURL)
        }
    }
    
    private func fastActivityVC(item: String) {
        let activityVC = UIActivityViewController(activityItems: [item], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        
            UIApplication.shared.keyWindow?.tintColor = lazyColor
        
        self.present(activityVC, animated: true, completion: nil)
    }
}
