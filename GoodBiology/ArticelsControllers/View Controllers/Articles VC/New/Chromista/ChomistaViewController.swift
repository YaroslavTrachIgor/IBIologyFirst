//
//  ChomistaViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 20.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

class ChomistaViewController: UIViewController, ArticlesViewControllerDelegate {

    @IBOutlet weak var sizeButton:   ChromistaButton!
    @IBOutlet weak var hideButton:   ChromistaButton!
    @IBOutlet weak var searchButton: ChromistaButton!
    
    @IBOutlet weak var sizeButtonBack:      ChromistaActionButtonsBack!
    @IBOutlet weak var hideButtonBack:      ChromistaActionButtonsBack!
    @IBOutlet weak var searchButtonBack:    ChromistaActionButtonsBack!
    
    @IBOutlet weak var textView:            UITextView!
    @IBOutlet weak var structureTextView:   UITextView!
    @IBOutlet weak var historyTextView:     UITextView!
    
    @IBOutlet weak var textViewBack:             ContentBack!
    @IBOutlet weak var structureTextViewBack:    ContentBack!
    @IBOutlet weak var historyTextViewBack:      ContentBack!
    
    @IBOutlet weak var structureLabel:  ChromistaLabel!
    @IBOutlet weak var basicsLabel:     ChromistaLabel!
    
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
        cornersSetup()
        contentSetup()
        alphaSetup()
        switchViewPrefering()
        stepperViewPrefering()
        backViewSetup()
    }
    
    func backViewSetup() {
        if #available(iOS 13.0, *) {
            view.backgroundColor = .secondarySystemBackground
            navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        }
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
        historyTextViewBack.alpha   = 0
        textViewBack.alpha          = 0
        structureTextViewBack.alpha = 0
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
        textView.layer.cornerRadius          = 22
        structureTextView.layer.cornerRadius = 22
        historyTextView.layer.cornerRadius   = 22
    }
    
    private func shadowsSetup() {
        textView.textViewShadow()
        structureTextView.textViewShadow()
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

// buttons Back shadow views
class ChromistaActionButtonsBack: UIView {
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setupView()
    }

    private func setupView() {
        backgroundColor     = .systemBackground
        layer.cornerRadius  = 16
        alpha = 0
        
        viewShadows()
    }
}

// Buttons (size, hide functions)
class ChromistaButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            setup()
    }
}

extension ChromistaButton: ChromistaButtonDelegate {
    func setup() {
        tintColor           = lazyColor
        layer.cornerRadius  = 16
    }
}

protocol ChromistaButtonDelegate {
    func setup()
}

// Labels - Headers of(Little Descriptions) Articles
protocol ChromistaLabelDelegate {
    func setupChromistaLabel()
}

class ChromistaLabel: UILabel {
    override init(frame: CGRect) {
      super.init(frame: frame)
        setupChromistaLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
        setupChromistaLabel()
    }
}

extension ChromistaLabel: ChromistaLabelDelegate {
    internal func setupChromistaLabel() {
        textColor = .secondaryLabel
        alpha     = 0
        
        labelShadow()
    }
}
