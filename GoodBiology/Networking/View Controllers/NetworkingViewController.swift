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

struct URLs {
    static let wikiURL = "https://www.wikipedia.org"
}

class NetworkingViewController: UIViewController, UISearchBarDelegate, UIWebViewDelegate, WebControllerDelegate {
    
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let objectsArray = [searchBar, webViewBaxckground, webView]
        
        UIView.animate(withDuration: 5) {
            self.goForwardButton.isEnabled       = true
            self.backButton.isEnabled            = true
            self.nextButton.isEnabled            = true
            self.tabBarVCshowingButton.isEnabled = true
            self.wikiButton.isEnabled            = true
            self.sitesButton.isEnabled           = true
        }
        
        for (index, objects) in objectsArray.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.23, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                
                objects?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
        }
    }
    
    func networkingProccesesPrefering() {
        webViewPrefering()
        webViewLoad()
        activityINPref()
        checkWiFi()
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
