//
//  AppIconViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 3/8/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

final class AppIconViewController: UIViewController {

    //MARK: @IBOutlets
    @IBOutlet weak var backButton:   UIButton!
    @IBOutlet weak var backButtonBackground: ChromistaActionButtonsBack! { didSet { backButtonBackground.alpha = 1 } }
    @IBOutlet weak var imageView: UIImageView! { didSet { imageView.imageViewShadow() } }
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var switchView: UIView!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// AboutAppVCSetupProtocol
        setupVC()
        
        /// For Analytics
        AnalyticsManeger.addInfoVCctionAnalytics(for: "App_Icon_View_Controller")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupViewDidApearAnimation()
    }
}



// MARK: IBActions
extension AppIconViewController {
    @IBAction func back(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func share(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [imageView.image], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        
            UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        self.present(activityVC, animated: true, completion: nil)
        
        shareButton.shareAudio()
    }
    
    @IBAction func switching(_ sender: UISwitch) {
        let shadowRadius: CGFloat
        if sender.isOn == true {
            shadowRadius = 17
            imageView.imageViewShadow()
            imageView.layer.shadowRadius = shadowRadius
            switchLabel.text = "Hide Shadow"
        } else {
            shadowRadius = 0
            imageView.layer.shadowRadius = shadowRadius
            switchLabel.text = "Show Shadow"
        }
    }
    
    @IBAction func switchViewShowing(_ sender: UIBarButtonItem) {
        if switchView.isHidden == false {
            switchView.isHidden = true
        } else {
            switchView.isHidden = false
        }
        
        /// For Analytics
        AnalyticsManeger.addArtcileChangeFunctionsHiddenAnalytics(article: "VideoPlayerViewController")
    }
}



//MARK: Main Functions
extension AppIconViewController {
    private func setupViewDidApearAnimation() {
        UIView.animate(withDuration: 0.5) {
            let alpha: CGFloat = 1
            self.imageView.alpha            = alpha
            self.backButtonBackground.alpha = alpha
        }
    }
}
