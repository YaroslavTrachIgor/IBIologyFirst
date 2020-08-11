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
    
    //MARK: URLs
    struct URLs {
        static let wikiURL = "https://www.wikipedia.org"
    }
    
    //MARK: Public
    let viewModel = NetworkingViewControllerViewModel()
    let animationManeger = BrowserAnimationManeger()
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var explanatoryView: ExplanatoryView!
    @IBOutlet weak var explanatoryTextView: ExplanatoryTextView!
    @IBOutlet weak var webViewBaxckground: WebViewBaxckground!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! { didSet { activityIndicator.activityIndicatorViewShadow() } }
    @IBOutlet weak var textSwitchView: UITextView!
    @IBOutlet weak var switchView: UIView!
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var mainToolBar: NetworkingViewControllerMainToolBar!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerViewBack: UIView!
    
    
    ///NetworkingButtons
    @IBOutlet weak var goForwardButton: NetworkingButton!
    @IBOutlet weak var backButton: NetworkingButton! { didSet { backButton.image = UIImage(systemName: "arrow.left") } }
    @IBOutlet weak var nextButton: NetworkingButton! { didSet { nextButton.image = UIImage(systemName: "arrow.right") } }
    @IBOutlet weak var wikiButton: NetworkingButton!
    @IBOutlet weak var sitesButton: NetworkingButton!
    @IBOutlet weak var mapGoButton: NetworkingButton!
    
    
    ///TransformImageViews
    @IBOutlet weak var image1: TransformImageView!
    @IBOutlet weak var image2: TransformImageView!
    @IBOutlet weak var image3: TransformImageView!
    @IBOutlet weak var image4: TransformImageView!
    @IBOutlet weak var image5: TransformImageView!

    
    //MARK: Array
    let sytesMenuArray = ["Wikipedia", "Google", "YouTube", "YouTube About Plants", "YouTube About Animals", "YouTube About Microbes"]
    
    
    //MARK: LifeCycle
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
