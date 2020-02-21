//
//  NetworkingViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12/1/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import WebKit
import AudioToolbox

class NetworkingViewController: UIViewController, UISearchBarDelegate, UIWebViewDelegate, WebControllerDelegate {
    
    struct URLs {
        static let wikiURL = "https://www.wikipedia.org"
    }
    
    //MARK: IBOutlets
    @IBOutlet weak var searchBar:             UISearchBar!
    
    @IBOutlet weak var explanatoryView:     ContentBack! {
        didSet {
            explanatoryView.isHidden = true
        }
    }
    @IBOutlet weak var explanatoryTextView: UITextView! {
        didSet {
            explanatoryTextView.font = UIFont(name: mediumFont, size: 14)
            explanatoryTextView.textColor = UIColor.systemGray
        }
    }
    
    @IBOutlet weak var webViewBaxckground:    ContentBack!
    @IBOutlet weak var webView:               WKWebView!
    
    @IBOutlet weak var activityIndicator:     UIActivityIndicatorView!
    
    @IBOutlet weak var goForwardButton:       NetworkingButton!
    @IBOutlet weak var backButton:            NetworkingButton!
    @IBOutlet weak var nextButton:            NetworkingButton!
    @IBOutlet weak var tabBarVCshowingButton: NetworkingButton!
    @IBOutlet weak var wikiButton:            NetworkingButton!
    @IBOutlet weak var sitesButton:           NetworkingButton!
    @IBOutlet weak var mapGoButton:           NetworkingButton!
    
    @IBOutlet weak var textSwitchView:        UITextView!
    @IBOutlet weak var switchView:            UIView!
    @IBOutlet weak var switchOutlet:          UISwitch!
    
    @IBOutlet weak var loadingLabel:          UILabel!
    
    @IBOutlet weak var pickerView:            UIPickerView!
    @IBOutlet weak var pickerViewBack:        UIView!
    
    let sytesMenuArray = ["Wikipedia", "Google", "YouTube", "YouTube About Plants", "YouTube About Animals", "YouTube About Microbes"]
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewBasicProccesesPrefering()
        networkingProccesesPrefering()
        articleVCProperty_NavBarHiddenSet()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let objectsArray = [searchBar, webViewBaxckground, webView]
        
        UIView.animate(withDuration: 5) {
            let isEnabled = true
            
            self.goForwardButton.isEnabled       = isEnabled
            self.backButton.isEnabled            = isEnabled
            self.nextButton.isEnabled            = isEnabled
            self.tabBarVCshowingButton.isEnabled = isEnabled
            self.wikiButton.isEnabled            = isEnabled
            self.sitesButton.isEnabled           = isEnabled
        }
        
        for (index, objects) in objectsArray.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.23, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                
                objects?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
        }
    }
    
    func networkingProccesesPrefering() {
        let firstQueue = DispatchQueue.global(qos: .utility)
        let mainBrowserVCDispatchGroup = DispatchGroup()
        
        firstQueue.async {
            mainBrowserVCDispatchGroup.enter()
            DispatchQueue.main.async {
                self.webViewLoad()
                self.activityINPref()
                self.checkWiFi()
            }
            mainBrowserVCDispatchGroup.leave()
        }
        webViewPrefering()
    }
    
    func viewBasicProccesesPrefering() {
        switchViewPrefering()
        pickerViewBackPrefering()
        systemBackColor()
    }
    
    private func checkWiFi() {
        let networkStatus = Reachability().connectionStatus()
        let alertController = UIAlertController(title: "Oops", message: "You are not connected to WiFi", preferredStyle: .alert)
        let action          = UIAlertAction(title: "Continue", style: .cancel) { (action) in }
        
        alertController.view.tintColor = lazyColor
        alertController.addAction(action)
        
        switch networkStatus {
        case .Unknown, .Offline:
            print("Offline")
            self.present(alertController, animated: true, completion: nil)
        case .Online(.WWAN):
            print("Connected via WWAN")
        case .Online(.WiFi):
            print("Connected via WiFi")
        }
    }
    
    @IBAction func pickerViewBackShowing(_ sender: Any) {
        if pickerViewBack.isHidden == true {
            pickerViewBack.isHidden  = false
            explanatoryView.isHidden = false
        } else {
            pickerViewBack.isHidden  = true
            explanatoryView.isHidden = true
        }
    }
    
    @IBAction func orgonize(_ sender: Any) {
        if switchView.isHidden == true {
            switchView.isHidden = false
        } else {
            switchView.isHidden = true
        }
    }
    
    @IBAction func `switch`(_ sender: UISwitch) {
        if sender.isOn == true {
            textSwitchView.text     = "Hide diffrent functions"
            
            wikiButton.isEnabled    = true
            nextButton.isEnabled    = true
            backButton.isEnabled    = true
        } else {
            textSwitchView.text     = "Show diffrent functions"
            
            wikiButton.isEnabled    = false
            nextButton.isEnabled    = false
            backButton.isEnabled    = false
        }
    }
    
    @IBAction func wikiOpen(_ sender: Any) {
        urlAnimation(url: URLs.wikiURL)
    }
    
    @IBAction func wikiOpenWithGestureRecognizer(_ sender: Any) {
        urlAnimation(url: URLs.wikiURL)
    }
    
    @IBAction func goForwardAction(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
        backItemGiven()
    }

    @IBAction func goBackButton(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
}
