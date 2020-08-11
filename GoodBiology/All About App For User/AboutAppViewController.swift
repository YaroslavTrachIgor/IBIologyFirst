//
//  AboutAppViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 2/10/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import AudioToolbox

final class AboutAppViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var contentBackground: ContentBack!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperView: UIView!
    @IBOutlet weak var shareButton: TestUIBarButtonItem!
    @IBOutlet weak var stepperViewShowerButton:     ChromistaButton!
    @IBOutlet weak var stepperViewShowerButtonBack: ChromistaActionButtonsBack!
    @IBOutlet weak var appIconShowerButton: ChromistaButton!
    @IBOutlet weak var appIconShowerButtonBack: ChromistaActionButtonsBack!
    
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// AboutAppVCSetupProtocol
        setupVC()
        
        /// For Analytics
        AnalyticsManeger.addInfoVCctionAnalytics(for: "Main_About_App_ViewController")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewDidApearAnimationSetup()
    }
}



// MARK: - @IBActions
extension AboutAppViewController {
    @IBAction func contentSizing(_ sender: UIStepper) {
        let font     = contentTextView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        contentTextView.font = UIFont(name: font!, size: fontSize)
    }
    
    @IBAction func stepperViewShowing(_ sender: Any) {
        if stepperView.isHidden == true {
            stepperView.isHidden = false
        } else {
            stepperView.isHidden = true
        }
    }
    
    @IBAction func sharing(_ sender: Any) {
        fastActivityVC(item: AboutAppStringInformation.appInfo)
        shareButton.shareAudio()
    }
    
    @IBAction func testSharing(_ sender: Any) {
        fastActivityVC(item: AboutAppStringInformation.testInfo)
        shareButton.shareAudio()
    }
}



// MARK: - Main Functions
extension AboutAppViewController {
    func viewDidApearAnimationSetup() {
        UIView.animate(withDuration: 0.4) {
            let views = [self.contentBackground, self.contentTextView, self.appIconShowerButtonBack, self.stepperViewShowerButtonBack]
            
            for (index, view) in views.enumerated() {
                let delay: Double = Double((index)) * 0.2
                
                UIView.animate(withDuration: 0.23, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                    view?.alpha = 1
                })
            }
        }
    }
}
