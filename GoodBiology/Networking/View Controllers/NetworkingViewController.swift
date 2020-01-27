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

class NetworkingButton: UIBarButtonItem {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        barButtonItemSetup()
    }
    
    
    func barButtonItemSetup() {
        let enabled: Bool = true
        
        isEnabled = enabled
        tintColor = lazyColor
    }
}

class NetworkingViewController: UIViewController, UISearchBarDelegate, UIWebViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, WebControllerDelegate {
    
    //MARK: IBOutlets
    @IBOutlet weak var searchBar:             UISearchBar!
    
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
    
    let array = ["Wikipedia", "Google", "YouTube", "YouTube About Plants", "YouTube About Animals", "YouTube About Microbes"]
    
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
        mainViewGradientPrefering()
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
    
    private func urlAnimation(url: String) {
        UIView.animate(withDuration: 6) {
            self.webView.alpha = 0
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.23, execute: {
                UIView.animate(withDuration: 0.6, delay: 0.6, options: .curveLinear, animations: {
                    
                    // Start Animate ActivityIndicator
                    self.webView.load(URLRequest(url: URL(string: url)!))
                    self.webView.alpha = 1
                    
                    self.activityIndicator.activityWake()
                }) {(finished) in
                    // Stop Animate ActivityIndicator
                    self.activityIndicator.activityStartsToSleep()
                }
            })
        }
    }
    
    private func systemBackColor() {
        if #available(iOS 13.0, *) {
            pickerView.tintColor = .secondaryLabel
            
            pickerViewBack.viewSystemBack()
            switchView.viewSystemBack()
            
            view.viewSystemBack()
        }
    }
    
    @IBAction func pickerViewBackShowing(_ sender: Any) {
        if pickerViewBack.isHidden == true {
            pickerViewBack.isHidden = false
        } else {
            pickerViewBack.isHidden = true
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    private func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row]
    }
    
    private func pickerViewBackPrefering() {
        pickerViewBack.viewSystemBack()
        pickerViewBack.layer.cornerRadius   = 12
        pickerViewBack.isHidden             = true
        
        pickerViewBack.viewShadows()
    }
    
     private func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if array[row] == "Wikipedia" {
            urlAnimation(url: "https://www.wikipedia.org")
        } else if array[row] == "YouTube About Plants" {
            urlAnimation(url: "https://www.youtube.com/results?search_query=plants")
        } else if array[row] == "YouTube About Animals" {
            urlAnimation(url: "https://www.youtube.com/results?search_query=animals+seince")
        } else if array[row] == "YouTube About Microbes" {
            urlAnimation(url: "https://www.youtube.com/results?search_query=microbes")
        } else {
            urlAnimation(url: "https://www.\(self.array[row]).com")
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        label.textColor     = .darkGray
        label.font          = UIFont(name: mediumFont, size: 18.4)
        label.textAlignment = .center
        label.text          = array[row]
        
        if array[row] == "YouTube About Animals" || array[row] == "YouTube About Microbes" || array[row] == "YouTube About Plants"{
            label.font = UIFont(name: "AvenirNext-Medium", size: 15.1)
        }
        return label
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
        coolURLLoad(url: "https://www.wikipedia.org")
    }
    
    private func coolURLLoad(url: String) {
        self.webView.alpha = 0
            
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1.23, execute: {
            UIView.animate(withDuration: 0, delay: 1, options: .curveLinear, animations: {
                
                self.webView.load(URLRequest(url: URL(string: url)!))
                self.webView.alpha = 1
                
                self.activityIndicator.activityWake()
            }) {(finished) in
                UIView.animate(withDuration: 0.3, animations: {
                    self.activityIndicator.activityStartsToSleep()
                })
            }
        })
    }
    
    private func coolReload() {
        self.webView.alpha = 0
        
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1.23, execute: {
            UIView.animate(withDuration: 0, delay: 1, options: .curveLinear, animations: {
                
                self.webView.reload()
                self.webView.alpha = 1
                
                self.activityIndicator.activityWake()
            }) {(finished) in
                UIView.animate(withDuration: 0.3, animations: {
                    self.activityIndicator.activityStartsToSleep()
                })
            }
        })
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
    
    private func backItemGiven() {
        if navigationItem.title == "Wikipedia" {
            navigationItem.title = "Internet"
        }
    }
    
    //MARK: Private
    internal func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    internal func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    private func webViewPrefering() {
        webViewSetup()
        webViewBaxckgroundSetup()
        loadingLabelSetup()
    }
    
    private func webViewSetup() {
        webView.load(URLRequest(url: URL(string: "https://www.google.com")!))
        webView.transform          = CGAffineTransform(scaleX: 0, y: 0)
        webView.alpha              = 0
    }
    
    private func webViewBaxckgroundSetup() {
        webViewBaxckground.layer.cornerRadius = CGFloat(cornerRadius)
        webViewBaxckground.viewShadows()
    }
    
    private func loadingLabelSetup() {
        loadingLabel.textColor = #colorLiteral(red: 0.6289012432, green: 0.6279886961, blue: 0.6433200836, alpha: 1)
    }
    
    private func switchViewPrefering() {
        switchView.isHidden = true
        
        switchView.editorsViews()
        switchOutlet.switchBasics()
        
        textSwitchView.switchTextViewPrefering()
    }
    
    private func webViewLoad() {
        UIView.animate(withDuration: 0, delay: 0.5, options: .curveLinear, animations: {
            self.webView.alpha = 1
        }) {(finished) in
            self.activityIndicator.activityIndicatorStop()
            self.loadingLabel.isHidden = true
        }
    }
    
    func activityINPref() {
        self.activityIndicator.activityIndicatorStarts(colorOfActivity: .darkGray)
    }
    
    func mainViewGradientPrefering() {
        view.viewGradient()
    }
}

extension UIActivityIndicatorView {
    func activityWake() {
        self.color = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.startAnimating()
        
        self.hidesWhenStopped = true
        
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func activityStartsToSleep() {
        self.stopAnimating()
        
        UIApplication.shared.endIgnoringInteractionEvents()
    }
}
