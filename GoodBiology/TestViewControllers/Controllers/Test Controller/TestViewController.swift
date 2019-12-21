//
//  TestViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/24/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import AudioToolbox

class TestViewController: UIViewController {
    
    // Basic Color for border, tint, 
    var lazyColor: UIColor = #colorLiteral(red: 0.03378171101, green: 0.2793948948, blue: 0.1025686339, alpha: 1)
    
    //MARK: IBOutlets
    @IBOutlet weak var testView:             UIView!
    @IBOutlet weak var secondTestView:       UIView!
    @IBOutlet weak var answerLabel:          UILabel!
    @IBOutlet weak var trueButtonOutlet:     UIButton!
    @IBOutlet weak var falseButtonOutlet:    UIButton!
    @IBOutlet weak var testTextView:         UITextView!
    @IBOutlet weak var stepperViewShower:    UIBarButtonItem!
    @IBOutlet weak var stepperView:          UIView!
    @IBOutlet weak var stepperOutlet:        UIStepper!
    @IBOutlet weak var secondTextView:       UITextView!
    @IBOutlet weak var shareButton:          UIBarButtonItem!
    @IBOutlet weak var cancelButton:         UIBarButtonItem!
    @IBOutlet weak var daneButton:           UIBarButtonItem!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        basicViewThingsPrefering()
        UISizingPrefering()
        otherUIthings()
        systemBackPrefering()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let objectsArray = [answerLabel, secondTestView, testView]
        
        for (index, objects) in objectsArray.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                UIApplication.shared.beginIgnoringInteractionEvents()
                objects?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
                    self.testTextView.alpha   = 1
                    self.secondTextView.alpha = 1
                })
            }) { (_) in
                UIApplication.shared.endIgnoringInteractionEvents()
            }
        }
    }
    
    private func buttonsFontPrefering() {
        trueButtonOutlet.titleLabel?.font = UIFont(name: "AvenirNext-demiBold", size: 15)
        falseButtonOutlet.titleLabel?.font = UIFont(name: "AvenirNext-demiBold", size: 15)
    }
    
    private func systemBackPrefering() {
        view.viewSystemBack()
        
        stepperView.viewSystemBack()
        testView.viewSystemBack()
        secondTestView.viewSystemBack()
        
        if #available(iOS 13.0, *) {
            trueButtonOutlet.backgroundColor  = .systemBackground
            falseButtonOutlet.backgroundColor = .systemBackground
        }
    }
    
    //MARK: Actions
    @IBAction func stepper(_ sender: UIStepper) {
        let font            = testTextView.font?.fontName
        let font2           = secondTextView.font?.fontName
        
        let fontSize        = CGFloat(sender.value)
        let fontSize2       = CGFloat(sender.value)
        
        testTextView.font   = UIFont(name: font!, size: fontSize)
        secondTextView.font = UIFont(name: font2!, size: fontSize2)
    }
    
    @IBAction func stepperViewShowerAction(_ sender: Any) {
        if stepperView.isHidden == true {
            stepperView.isHidden    = false
            
            cancelButton.isEnabled  = false
            shareButton.isEnabled   = false
        } else {
            stepperView.isHidden    = true
            
            cancelButton.isEnabled  = true
            shareButton.isEnabled   = false
        }
    }
    
    private func falseAndTrueButtonsForAnswersPrefering() {
        trueButtonOutlet.isEnabled  = false
        falseButtonOutlet.isEnabled = false
        
        shareButton.isEnabled       = true
        stepperViewShower.isEnabled = false
        
        trueButtonOutlet.alpha      = 0.5
        falseButtonOutlet.alpha     = 0.5
        
        trueButtonOutlet.setTitle(trueWord, for: .normal)
        trueButtonOutlet.setTitleColor(#colorLiteral(red: 0.03378171101, green: 0.2793948948, blue: 0.1025686339, alpha: 1), for: .normal)
        
        falseButtonOutlet.setTitle(falseWord, for: .normal)
        falseButtonOutlet.setTitleColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.798640839), for: .normal)
        falseButtonOutlet.layer.borderColor = #colorLiteral(red: 0.6207774878, green: 0.1583663821, blue: 0.07822974771, alpha: 0.8047945205)
        falseButtonOutlet.testFalseButtonsShadows()
    }
    
    //MARK: Actions
    @IBAction func trueButton(_ sender: UIButton) {
        trueShow()
        trueAudio()
        
        sender.flash()
    }
    
    private func trueShow() {
        answerLabel.text        = trueWord
        answerLabel.textColor   = #colorLiteral(red: 0.03378171101, green: 0.2793948948, blue: 0.1025686339, alpha: 1)
        
        let alertController = UIAlertController(title: trueWord, message: nil, preferredStyle: .alert)
        let action          = UIAlertAction(title: okWord, style: .cancel) { (action) in }
                     alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: #colorLiteral(red: 0.004247154575, green: 0.453612864, blue: 0.1538792849, alpha: 1))
                     alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
                     alertController.view.tintColor = lazyColor
                     alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        
        falseAndTrueButtonsForAnswersPrefering()
    }
    
    private func trueAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1008))
    }
    
    @IBAction func falseButton(_ sender: UIButton) {
        falseShow()
        falseAudio()
        
        sender.flash()
    }
    
    private func falseShow() {
        answerLabel.text        = falseWord
        answerLabel.textColor   = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.802145762)
        
        let alertController = UIAlertController(title: falseWord, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: okWord, style: .cancel) {
            (action) in }
                     alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.802145762))
                     alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
                     alertController.view.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.802145762)
                     alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        
        falseAndTrueButtonsForAnswersPrefering()
    }
    
    private func falseAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1009))
    }
    
    @IBAction func cancel(_ sender: Any) {
        canceling()
    }
    
    private func canceling() {
        if answerLabel.text == answerWord {
            let alertController = UIAlertController(title: sorryWord, message: "but you haven't answerd yet", preferredStyle: .alert)
            let action = UIAlertAction(title: okWord, style: .cancel)
            
                        alertController.view.tintColor = #colorLiteral(red: 0.03378171101, green: 0.2793948948, blue: 0.1025686339, alpha: 1)
                        alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
                        alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
                        alertController.addAction(action)
           self.present(alertController, animated: true, completion: nil)
            
        } else if answerLabel.text == trueWord || answerLabel.text == falseWord {
            trueButtonOutlet.setTitle(itsTrueWord, for: .normal)
            falseButtonOutlet.setTitle(itsTrueWord, for: .normal)
            
            falseButtonOutlet.setTitleColor(lazyColor, for: .normal)
            falseButtonOutlet.layer.borderColor = #colorLiteral(red: 0.03378171101, green: 0.2793948948, blue: 0.1025686339, alpha: 1)
            falseButtonOutlet.testButtonsShadows()
            
            trueButtonOutlet.isEnabled  = true
            falseButtonOutlet.isEnabled = true
            
            shareButton.isEnabled       = false
            stepperViewShower.isEnabled = true
            
            trueButtonOutlet.alpha  = 1
            falseButtonOutlet.alpha = 1
            
            answerLabel.text = answerWord
            if #available(iOS 13.0, *) {
                answerLabel.textColor = .secondaryLabel
            }
        }
        
        cancelAudio()
    }
    
    private func cancelAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1050))
    }
    
    @IBAction func doneTest(_ sender: Any) {
        donning()
    }
    
    private func donning() {
        if answerLabel.text == answerWord {
            let alertController = UIAlertController(title: sorryWord, message: "but answer is empty", preferredStyle: .alert)
            let action = UIAlertAction(title: okWord, style: .cancel) { (action) in }
            
            
            alertController.addAction(action)
            alertController.view.tintColor = #colorLiteral(red: 0.03378171101, green: 0.2793948948, blue: 0.1025686339, alpha: 1)
            alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
            alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else if answerLabel.text == trueWord {
            let alertController = UIAlertController(title: goodWord, message: "Thanks for passing the test", preferredStyle: .alert)
            let action = UIAlertAction(title: okWord, style: .cancel) { (action) in }
            
            alertController.addAction(action)
            alertController.view.tintColor = lazyColor
            alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
            alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
            
            self.present(alertController, animated: true, completion: nil)
            
            if navigationItem.title == "Viruses Test" {
                RateManager.showRatesController()
            }
            
        } else if answerLabel.text == falseWord {
            let alertController = UIAlertController(title: sorryWord, message: "but you answered incorrectly", preferredStyle: .alert)
            let action = UIAlertAction(title: okWord, style: .destructive) { (action) in }
            
            alertController.addAction(action)
            alertController.view.tintColor = #colorLiteral(red: 0.03378171101, green: 0.2793948948, blue: 0.1025686339, alpha: 1)
            alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
            alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func sharing(_ sender: Any) {
        share()
        shareAudio()
    }
    
    private func shareAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1001))
    }
    
    private func share() {
        let string = navigationItem.title
        
        fastActivityVC(item: string ?? .init())
    }
    
    private func fastActivityVC(item: String) {
        let activityVC = UIActivityViewController(activityItems: [item], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        
            UIApplication.shared.keyWindow?.tintColor = #colorLiteral(red: 0.03378171101, green: 0.2793948948, blue: 0.1025686339, alpha: 1)
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    private func preferAnswerButtons() {
        falseButtonOutlet.testButtonsPrefering()
        trueButtonOutlet.testButtonsPrefering()
        
        buttonsFontPrefering()
    }

    private func answerLabelPrefering() {
        answerLabel.font = UIFont(name: "AvenirNext-Bold", size: 20.5)
        answerLabel.labelSystemColor()
    }
    
    private func barButtonTintPrefering() {
        shareButton.testBarButtonItemsTint()
        cancelButton.testBarButtonItemsTint()
        stepperViewShower.testBarButtonItemsTint()
    }
    
    private func shadowsPrefering() {
        secondTestView.viewShadows()
        testView.viewShadows()
        
        trueButtonOutlet.testButtonsShadows()
        falseButtonOutlet.testButtonsShadows()
        
        textViews_And_AnswerLabel_ShadowsPrefering()
    }
    
    private func textViews_And_AnswerLabel_ShadowsPrefering() {
        let testViewShadowRadius = 3
        
        testTextView.textViewShadow()
        testTextView.layer.shadowRadius = CGFloat(testViewShadowRadius)
        
        secondTextView.textViewShadow()
        secondTextView.layer.shadowRadius = CGFloat(testViewShadowRadius)
        
        testTextView.layer.shadowRadius     = 0.8
        secondTextView.layer.shadowRadius   = 0.8
        
        answerLabel.labelShadow()
        testTextView.layer.shadowRadius     = 0.5
    }
    
    private func textColorPrefering() {
        testTextView.basicTextView()
        secondTextView.basicTextView()
    }
    
    private func textEditButtonSetup() {
        stepperViewShower?.setBackgroundImage(UIImage(named: "textFormat.size"), for: .normal, barMetrics: .default)
    }
    
    private func UISizingPrefering() {
        secondTestView.transform = CGAffineTransform(scaleX: 0, y: 0)
        testView.transform       = CGAffineTransform(scaleX: 0, y: 0)
        answerLabel.transform    = CGAffineTransform(scaleX: 0, y: 0)
    }
    
    private func otherUIthings() {
        shadowsPrefering()
        stepperView.editorsViews()
        stepperOutlet.stepperBaics()
        shareButton.isEnabled = false
    }
    
    private func cornerRadiusPrefering() {
        let corRad = 16
        
        testView.layer.cornerRadius         = CGFloat(corRad)
        secondTestView.layer.cornerRadius   = CGFloat(corRad)
    }
    
    private func textViewAlphaPrefering() {
        testTextView.alpha   = 0
        secondTextView.alpha = 0
    }
    
    private func buttonsCornerRadiusPrfering() {
        let corRad = 14
        
        trueButtonOutlet.layer.cornerRadius  = CGFloat(corRad)
        falseButtonOutlet.layer.cornerRadius = CGFloat(corRad)
    }
    
    private func shadowTextButtonsPrefering() {
        let shadowOpacity = 0.7
        
        trueButtonOutlet.titleLabel?.labelShadow()
        trueButtonOutlet.titleLabel?.layer.shadowOpacity = Float(shadowOpacity)
        
        falseButtonOutlet.titleLabel?.labelShadow()
        falseButtonOutlet.titleLabel?.layer.shadowOpacity = Float(shadowOpacity)
    }
    
    private func basicViewThingsPrefering() {
        textViewAlphaPrefering()
        textColorPrefering()
        preferAnswerButtons()
        barButtonTintPrefering()
        cornerRadiusPrefering()
        answerLabelPrefering()
        buttonsCornerRadiusPrfering()
        shadowTextButtonsPrefering()
        textEditButtonSetup()
        
        
    }
}

extension UITextView {
    func basicTextView() {
        self.textColor  = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        self.font       = UIFont(name: "AvenirNext-Medium", size: 16)
    }
}

extension UIButton {
    func testButtonsPrefering() {
        self.setTitleColor(lazyColor, for: .normal)
        self.titleLabel?.font       = .boldSystemFont(ofSize: 16)
        self.backgroundColor        =  #colorLiteral(red: 0.943613708, green: 0.9437716603, blue: 0.9435929656, alpha: 1)
        self.titleLabel?.textColor  =  #colorLiteral(red: 0.03378171101, green: 0.2793948948, blue: 0.1025686339, alpha: 1)
        self.layer.borderColor      =  #colorLiteral(red: 0.03378171101, green: 0.2793948948, blue: 0.1025686339, alpha: 1)
        self.layer.borderWidth      =  2.55
    }
}
