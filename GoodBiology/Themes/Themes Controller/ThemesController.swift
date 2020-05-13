//
//  ThemesController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 2/12/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

final class ThemesController: UIViewController {
    
    // MARK: @IBOutles
    @IBOutlet weak var contentBackground: UIView!
    @IBOutlet weak var contentTextView:   UITextView!
    
    @IBOutlet weak var stepperViewShowingButton: UIBarButtonItem!
    
    @IBOutlet weak var stepperView: UIView!
    @IBOutlet weak var stepper:     UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalView()
        systemColorPrefering()
        navControllerSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6) {
            self.contentBackground.alpha = 1
        }
    }
}

// MARK: - ArticlesViewControllerDelegate
extension ThemesController: ArticlesViewControllerDelegate {
    func finalView() {
        rate()
        cornerGiven()
        contentGiven()
        basicView()
    }
}

// MARK: - @IBAction
extension ThemesController {
    @objc func shareContentGiven() {
        if let text = contentTextView.text {
            fastActivityVC(content: text)
        } else { return }
    }
    
    @objc func stepperViewShowing() {
        if stepperView.isHidden == true {
            stepperView.isHidden = false
        } else {
            stepperView.isHidden = true
        }
    }
    
    @IBAction func stepperViewShowing(_ sender: Any) {
        if stepperView.isHidden == true {
            stepperView.isHidden = false
        } else {
            stepperView.isHidden = true
        }
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        let font     = contentTextView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        contentTextView.font = UIFont(name: font!, size: fontSize)
    }
    
    @IBAction func share(_ sender: Any) {
        shareContentGiven()
    }
}

// MARK: - Main Functions
extension ThemesController {
    private func fastActivityVC(content: String) {
        let activityVC = UIActivityViewController(activityItems: [content], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        
            UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    private func basicView() {
        contentTextViewSetup()
        stepperViewSetup()
        contentBackgroundSetup()
    }
    
    private func rate() {
        if navigationItem.title == "Fungi" {
            RateManager.showRatesController()
        }
    }
    
    private func cornerGiven() {
        let cornerRadius = 20
        
        contentBackground.layer.cornerRadius = CGFloat(cornerRadius)
        contentTextView.layer.cornerRadius   = CGFloat(cornerRadius)
    }
    
    private func contentTextViewSetup() {
        contentTextView.font      = UIFont(name: "AvenirNext-Medium", size: 17)
        contentTextView.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
    }
    
    private func contentBackgroundSetup() {
        contentBackground.viewShadows()
        contentBackground.alpha = 0
    }
    
    private func stepperViewSetup() {
        stepperView.editorsViews()
        
        stepperSetup()
    }
    
    private func stepperSetup() {
        stepper.stepperBaics()
    }
    
    private func systemColorPrefering() {
        view.viewSystemBack()
        
        contentBackground.viewSystemBack()
        stepperView.viewSystemBack()
    }
    
    private func navControllerSetup() {
        if #available(iOS 13.0, *) {
            let stepperViewShowingButton = UIBarButtonItem(image: UIImage(systemName: "textformat.size"), style: .plain, target: self, action: #selector(stepperViewShowing(_:)))
            let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareContentGiven))
            
            navigationItem.rightBarButtonItems = [stepperViewShowingButton, shareButton]
        }
    }
}
