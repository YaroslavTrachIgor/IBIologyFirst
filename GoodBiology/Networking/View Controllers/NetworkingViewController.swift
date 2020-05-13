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

final class NetworkingViewController: UIViewController, UISearchBarDelegate {
    
    struct URLs {
        static let wikiURL = "https://www.wikipedia.org"
    }
    
    //MARK: Public
    let viewModel = NetworkingViewControllerViewModel()
    let animationManeger = BrowserAnimationManeger()
    
    //MARK: - IBOutlets
    /// UIImages for animation Preview
    // MARK: - TransformImageView
    @IBOutlet weak var image1: TransformImageView!
    @IBOutlet weak var image2: TransformImageView!
    @IBOutlet weak var image3: TransformImageView!
    @IBOutlet weak var image4: TransformImageView!
    @IBOutlet weak var image5: TransformImageView!
    
    // MARK: - searchBar
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - explanatoryView
    @IBOutlet weak var explanatoryView:     ExplanatoryView!
    @IBOutlet weak var explanatoryTextView: ExplanatoryTextView!
    
    // MARK: - webViewBaxckground and webView
    @IBOutlet weak var webViewBaxckground: WebViewBaxckground!
    @IBOutlet weak var webView:            WKWebView!
    
    // MARK: - UIActivityIndicatorView
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! { didSet { activityIndicator.activityIndicatorViewShadow() } }
    
    // MARK: - NetworkingButtons
    @IBOutlet weak var goForwardButton: NetworkingButton!
    @IBOutlet weak var backButton:      NetworkingButton! { didSet { backButton.image = UIImage(systemName: "arrow.left") } }
    @IBOutlet weak var nextButton:      NetworkingButton! { didSet { nextButton.image = UIImage(systemName: "arrow.right") } }
    @IBOutlet weak var wikiButton:      NetworkingButton!
    @IBOutlet weak var sitesButton:     NetworkingButton!
    @IBOutlet weak var mapGoButton:     NetworkingButton!
    
    // MARK: - switchView
    @IBOutlet weak var textSwitchView: UITextView!
    @IBOutlet weak var switchView:     UIView!
    @IBOutlet weak var switchOutlet:   UISwitch!
    
    // MARK: - UILabel
    @IBOutlet weak var loadingLabel: UILabel!
    
    // Main Tool Bar
    @IBOutlet weak var mainToolBar: NetworkingViewControllerMainToolBar!
    
    // MARK: - pickerView and pickerViewBack
    @IBOutlet weak var pickerView:     UIPickerView!
    @IBOutlet weak var pickerViewBack: UIView!
    
    // MARK: - Array
    let sytesMenuArray = ["Wikipedia", "Google", "YouTube", "YouTube About Plants", "YouTube About Animals", "YouTube About Microbes"]
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewBasicProccesesPrefering()
        networkingProccesesPrefering()
        articleVCProperty_NavBarHiddenSet()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewDidApperAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.setupViewWillApearNavController(navigationController!)
    }
}
