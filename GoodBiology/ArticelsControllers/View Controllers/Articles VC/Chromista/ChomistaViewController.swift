//
//  ChomistaViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 20.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

class ChomistaViewController: UIViewController, ArticlesViewControllerDelegate {

    @IBOutlet weak var sizeButton:   UIButton!
    @IBOutlet weak var hideButton:   UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var sizeButtonBack:      UIView!
    @IBOutlet weak var hideButtonBack:      UIView!
    @IBOutlet weak var searchButtonBack:    UIView!
    
    @IBOutlet weak var textView:            UITextView!
    @IBOutlet weak var structureTextView:   UITextView!
    @IBOutlet weak var historyTextView:     UITextView!
    
    @IBOutlet weak var textViewBack:             UIView!
    @IBOutlet weak var structureTextViewBack:    UIView!
    @IBOutlet weak var historyTextViewBack:      UIView!
    
    @IBOutlet weak var structureLabel:  UILabel!
    @IBOutlet weak var basicsLabel:     UILabel!
    
    @IBOutlet weak var stepperView: UIView!
    @IBOutlet weak var stepper:     UIStepper!
    
    @IBOutlet weak var switchOutlet:    UISwitch!
    @IBOutlet weak var switchView:      UIView!
    @IBOutlet weak var switchTextView:  UITextView!
    
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       finalView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let views = [sizeButtonBack, searchButtonBack, hideButtonBack]
        for (index, view) in views.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                UIApplication.shared.beginIgnoringInteractionEvents()
                view?.alpha = 1
            }) { (_) in
                UIApplication.shared.endIgnoringInteractionEvents()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let views = [self.basicsLabel,
                         self.textViewBack,
                         self.structureLabel,
                         self.structureTextViewBack,
                         self.historyTextViewBack]
            for (index, view) in views.enumerated() {
                let delay: Double = Double((index)) * 0.2
                
                UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                    UIApplication.shared.beginIgnoringInteractionEvents()
                    view?.alpha = 1
                }) { (_) in
                    UIApplication.shared.endIgnoringInteractionEvents()
                }
            }
        }
    }
    
    func finalView() {
        shadowsSetup()
        barButtonTintSetup()
        cornersSetup()
        contentSetup()
        alphaSetup()
        switchViewPrefering()
        stepperViewPrefering()
    }
    
    private func stepperViewPrefering() {
        stepperView.editorsViews()
        stepper.stepperBaics()
    }
    
    private func switchViewPrefering() {
        switchView.editorsViews()
        switchView.isHidden = true
        
        switchOutlet.switchBasics()
        switchOutlet.backgroundColor = .none
        
        switchTextView.mainTextViewTextColor(alpha: 1)
        switchTextView.textViewShadow()
        switchTextView.switchTextViewPrefering()
    }
    
    private func alphaSetup() {
        sizeButtonBack.alpha        = 0
        hideButtonBack.alpha        = 0
        searchButtonBack.alpha      = 0
        historyTextViewBack.alpha   = 0
        textViewBack.alpha          = 0
        structureTextViewBack.alpha = 0
        basicsLabel.alpha           = 0
        structureLabel.alpha        = 0
    }
    
    private func contentSetup() {
        structureTextView.text =
        """
        Chromista has been defined in different ways at different times. The name Chromista was first introduced by Cavalier-Smith in 1981; the earlier names Chromophyta, Chromobiota and Chromobionta correspond to roughly the same group.

        It has been described as consisting of three different groups:

        Heterokonts or stramenopiles: brown algae, diatoms, water moulds, etc.
        Haptophytes
        Cryptomonads
        
        In 2010, Thomas Cavalier-Smith indicated his desire to move Alveolata, Rhizaria and Heliozoa into Chromista.

        Some examples of classification of the Chromista and related groups are shown below.
        """
    }
    
    private func cornersSetup() {
        textViewBack.layer.cornerRadius             = 22
        structureTextViewBack.layer.cornerRadius    = 22
        historyTextViewBack.layer.cornerRadius      = 22
        
        textView.layer.cornerRadius          = 22
        structureTextView.layer.cornerRadius = 22
        historyTextView.layer.cornerRadius = 22
        
        sizeButton.layer.cornerRadius   = 16
        hideButton.layer.cornerRadius   = 16
        searchButton.layer.cornerRadius = 16
        
        sizeButtonBack.layer.cornerRadius   = 16
        hideButtonBack.layer.cornerRadius   = 16
        searchButtonBack.layer.cornerRadius = 16
    }
    
    private func barButtonTintSetup() {
        sizeButton.tintColor    = lazyColor
        hideButton.tintColor    = lazyColor
        searchButton.tintColor  = lazyColor
    }
    
    private func shadowsSetup() {
        textViewBack.viewShadows()
        structureTextViewBack.viewShadows()
        historyTextViewBack.viewShadows()
        
        textView.textViewShadow()
        structureTextView.textViewShadow()
        
        sizeButtonBack.viewShadows()
        hideButtonBack.viewShadows()
        searchButtonBack.viewShadows()
        
        structureLabel.labelShadow()
        basicsLabel.labelShadow()
    }
    //MARK: Action
    @IBAction func editButton(_ sender: Any) {
        if switchView.isHidden == false {
            switchView.isHidden = true
        } else {
            switchView.isHidden = false
        }
    }
    
    @IBAction func shareContent(_ sender: Any) {
    }
    
    @IBAction func settingsButtonAction(_ sender: Any) {
        if stepperView.isHidden == true {
            stepperView.isHidden    = false
        } else {
            stepperView.isHidden    = true
        }
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if sender.isOn == true {
            hideButtonBack.isHidden             = false
            searchButtonBack.isHidden           = false
            sizeButtonBack.isHidden             = false
            shareButton.isEnabled               = true
            switchTextView.text                 = "Hide  diffrent functions"
        } else {
            hideButtonBack.isHidden             = true
            searchButtonBack.isHidden           = true
            shareButton.isEnabled               = false
            stepperView.isHidden                = true
            switchTextView.text                 = "Show diffrent functions"
        }
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        let font       = textView.font?.fontName
        let font1      = historyTextView.font?.fontName
        let font2      = structureTextView.font?.fontName
        
        let fontSize   = CGFloat(sender.value)
        
        textView.font           = UIFont(name: font!, size: fontSize)
        historyTextView.font    = UIFont(name: font1!, size: fontSize)
        structureTextView.font  = UIFont(name: font2!, size: fontSize)
    }
}
