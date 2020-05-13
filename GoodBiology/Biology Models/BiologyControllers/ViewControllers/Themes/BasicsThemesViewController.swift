//
//  BasicsThemesViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 04.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds

extension BasicsThemesViewController: PlantsViewControllerAdMobBannerSetupProtocol {
    func showBunner() {
        if interstitial.isReady {
          interstitial.present(fromRootViewController: self)
        }
    }
    
    func setupBanner() {
        let request = GADRequest()
        
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-8702634561077907/3602528777")
        interstitial.load(request)
    }
}

class BasicsThemesViewController: UIViewController {
    
    // Google ADMob Banner
    var interstitial: GADInterstitial!
    
    // Share Button
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    // Content
    @IBOutlet weak var contentBack:     ContentBack!
    @IBOutlet weak var contentTextView: UITextView!
        
    // Stepper View
    @IBOutlet weak var stepperViewShowingButton: UIButton!
    @IBOutlet weak var stepperShowerButtonBack:  ChromistaActionButtonsBack! { didSet { stepperShowerButtonBack.alpha = 1 } }
    @IBOutlet weak var stepperView: ContentBack! { didSet { stepperView.isHidden = false } }
    @IBOutlet weak var stepper:     UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// BasicsThemesViewControllerSetupProtocol
        setupVC()
        setupBanner()
    }
}


// MARK: - @IBActions
extension BasicsThemesViewController {
    @IBAction func changeContentTextSize(_ sender: UIStepper) {
        let font     = contentTextView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        contentTextView.font = UIFont(name: font!, size: fontSize)
    }
    
    
    @IBAction func showStepperView(_ sender: Any) {
        let hidden: Bool = true
    
        if stepperView.isHidden == hidden {
            stepperView.isHidden = !hidden
        } else {
            stepperView.isHidden = hidden
        }
        showBunner()
    }
    
    
    @IBAction func share(_ sender: UIBarButtonItem) {
        guard let text = contentTextView.text else { return }
        
        let activityVC = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        self.present(activityVC, animated: true)
    }
}


// MARK: - Main Functions
extension BasicsThemesViewController {
    func setupContent() {
        contentTextView.text = BiologyAllStringData.biologyData[BiologyAllStringData.index]
        navigationItem.title = BiologyAllStringData.biologyTitlesArray[BiologyAllStringData.index]
    }
    
    func setupContentTextView() {
        
        /// UIFont
        contentTextView.font = UIFont(name: BasicFonts.mediumFont, size: 16)
        
        /// Corner Radius
        contentTextView.layer.cornerRadius = 20
        
        /// Text Color
        contentTextView.textColor = #colorLiteral(red: 0.3089782768, green: 0.3345375323, blue: 0.3716687817, alpha: 1)
        
        contentTextView.isEditable = false
    }
    
    func viewBackColorSetup() {
        view.backgroundColor = .groupTableViewBackground
    }
}
 

protocol BasicsThemesViewControllerSetupProtocol {
    func setupVC()
}


// MARK: - BasicsThemesViewControllerSetupProtocol
extension BasicsThemesViewController: BasicsThemesViewControllerSetupProtocol {
    func setupVC() {
        setupContentTextView()
        setupContent()
        
        viewBackColorSetup()
    }
}
