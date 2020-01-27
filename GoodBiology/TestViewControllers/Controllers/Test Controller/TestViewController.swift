//
//  TestViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/24/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import AudioToolbox

class TestErrors {
    enum CancellingErrors: Error {
        case answerIsDefault
        case cancel
    }
    
    enum DoneErrors: Error {
        case doneTest
        case answerIsDefault
    }
}

struct TestViewKeys {
    static let plantsViewKey    = "PlantsViewKey"
    static let animalsViewKey   = "AnimalsViewKey"
    static let archaeaViewKey   = "ArchaeaViewKey"
    static let microbesViewKey  = "MicrobesViewKey"
    static let virusesViewKey   = "VirusesViewKey"
    static let humanViewKey     = "HumanViewKey"
    static let fungusesViewKey  = "FungusesViewKey"
}

class TestViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var testView:             TestBackView!
    @IBOutlet weak var secondTestView:       TestBackView!
    
    @IBOutlet weak var answerLabel:          AnswerLabel!
    
    @IBOutlet weak var trueButtonOutlet:     TestButton!
    @IBOutlet weak var falseButtonOutlet:    TestButton!
    private var falseTint = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.798640839)
    
    @IBOutlet weak var stepperView:          TestStepperView!
    @IBOutlet weak var stepperOutlet:        UIStepper!
    
    @IBOutlet weak var secondTextView:       TestTextView!
    @IBOutlet weak var testTextView:         TestTextView!
    
    @IBOutlet weak var stepperViewShower:       TestUIBarButtonItem!
    @IBOutlet weak var shareButton:             TestUIBarButtonItem!
    @IBOutlet weak var cancelButton:            TestUIBarButtonItem!
    @IBOutlet weak var doneButton:              TestUIBarButtonItem!
    @IBOutlet weak var goToNextTestPageButton:  TestUIBarButtonItem!
    
    private var score = ""
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        otherUIthings()
        systemBackPrefering()
        postKeys()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let objectsArray = [answerLabel, secondTestView, testView]
        
        for (index, objects) in objectsArray.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                objects?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
                    let alpha: CGFloat = 1
                    
                    self.testTextView.alpha   = alpha
                    self.secondTextView.alpha = alpha
                })
            })
        }
    }
    
    private func setScore() {
        if answerLabel.text != answerWord || answerLabel.textColor != .secondaryLabel {
            if answerLabel.text == falseWord {
                let number2  = Int.random(in: 1 ..< 12)
                let number1 = 0
                let number  = Int.random(in: 20 ..< 35)
                
                let numberArray = [String(number1), String(number), String(number2)]
                
                score = String(numberArray.randomElement() ?? description)
            } else {
                let number1 = Int.random(in: 95 ..< 100)
                let number  = Int.random(in: 64 ..< 80)
                
                let numberArray = [String(number1), String(number)]
                
                score = String(numberArray.randomElement() ?? description)
            }
        }
    }
    
    private func systemBackPrefering() {
        view.viewSystemBack()
        
        stepperView.viewSystemBack()
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
        let alpha = CGFloat(0.5)
        let enabled = false
        
        trueButtonOutlet.isEnabled  = enabled
        falseButtonOutlet.isEnabled = enabled
        
        shareButton.isEnabled       = !enabled
        stepperViewShower.isEnabled = enabled
        
        trueButtonOutlet.alpha      = alpha
        falseButtonOutlet.alpha     = alpha
        
        trueButtonOutlet.setTitle(trueWord, for: .normal)
        trueButtonOutlet.setTitleColor(lazyColor, for: .normal)
        
        falseButtonOutlet.setTitle(falseWord, for: .normal)
        falseButtonOutlet.setTitleColor(falseTint, for: .normal)
        falseButtonOutlet.layer.borderColor = #colorLiteral(red: 0.6207774878, green: 0.1583663821, blue: 0.07822974771, alpha: 0.8047945205)
        falseButtonOutlet.testFalseButtonsShadows()
    }
    
    //MARK: Actions
    
    //MARK: True
    // True Functions Start
    @IBAction func trueButton(_ sender: UIButton) {
        trueShow()
        trueAudio()
        
        sender.flash()
    }
    
    private func trueShow() {
        answerLabel.text        = trueWord
        answerLabel.textColor   = lazyColor
    
        falseAndTrueButtonsForAnswersPrefering()
    }
    
    private func trueAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1008))
    }
    // True Functions End
    
    //MARK: False
    // False Functions Start
    @IBAction func falseButton(_ sender: UIButton) {
        falseShow()
        falseAudio()
        
        sender.flash()
    }
    
    private func falseShow() {
        answerLabel.text        = falseWord
        answerLabel.textColor   = falseTint
        
        falseAndTrueButtonsForAnswersPrefering()
    }
    
    private func falseAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1009))
    }
    // False Functions End
    
    //MARK: Cancel
    private func cancelErrorsShow() {
        do {
            try cancelErrorsSetup()
        } catch TestErrors.CancellingErrors.answerIsDefault {
            FastAlert.showBasic(title: errorWord, message: "You haven't answerd yet", vc: self)
            
        } catch TestErrors.CancellingErrors.cancel {
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
        } catch {
            FastAlert.showBasic(title: "Unavailable", message: "", vc: self)
        }
    }
    
    private func cancelErrorsSetup() throws {
        if answerLabel.text == answerWord {
            throw TestErrors.CancellingErrors.answerIsDefault
        } else {
            throw TestErrors.CancellingErrors.cancel
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        cancelErrorsShow()
    }
    
    //MARK: Done Test
    @IBAction func doneTest(_ sender: Any) {
        setScore()
        setDonningAlerts()
    }
    
    private func doneTestErrorsSetup() throws {
        if answerLabel.text == answerWord || answerLabel.textColor == .secondaryLabel {
            throw TestErrors.DoneErrors.answerIsDefault
        } else {
            throw TestErrors.DoneErrors.doneTest
        }
    }
    
    private func doneTestErrorsShow() {
        do {
            try doneTestErrorsSetup()
        } catch TestErrors.DoneErrors.answerIsDefault {
            FastAlert.showBasic(title: errorWord, message: "You haven't answerd yet", vc: self)
        } catch TestErrors.DoneErrors.doneTest {
            setDonningAlerts()
            postKeys()
        } catch {
            FastAlert.showBasic(title: "Unavailable", message: "", vc: self)
        }
    }
    
    private func setDonningAlerts() {
        let alertController = UIAlertController(title: goodWord, message: "Score \(score) %", preferredStyle: .alert)
        let action = UIAlertAction(title: okWord, style: .cancel) { (action) in
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        alertController.addAction(action)
        alertController.view.tintColor = lazyColor
        alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
        alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
        
        self.present(alertController, animated: true, completion: nil)
        
        showRatesController()
    }
    
    private func postKeys() {
        var name = Notification.Name("")
        
        if navigationItem.title == "Plants Test Final" {
            name = Notification.Name(rawValue: TestViewKeys.plantsViewKey)
            NotificationCenter.default.post(name: name, object: nil)
            
        } else if navigationItem.title == "Animals Test Final" {
            name = Notification.Name(rawValue: TestViewKeys.animalsViewKey)
            NotificationCenter.default.post(name: name, object: nil)
            
        } else if navigationItem.title == "Humen Test Final" {
            name = Notification.Name(rawValue: TestViewKeys.humanViewKey)
            NotificationCenter.default.post(name: name, object: nil)
            
        } else if navigationItem.title == "Microbes Test Final" {
            name = Notification.Name(rawValue: TestViewKeys.microbesViewKey)
            NotificationCenter.default.post(name: name, object: nil)
            
        } else if navigationItem.title == "Viruses Test Final" {
            name = Notification.Name(rawValue: TestViewKeys.virusesViewKey)
            NotificationCenter.default.post(name: name, object: nil)
            
        } else if navigationItem.title == "Archaea Test Final" {
            name = Notification.Name(rawValue: TestViewKeys.archaeaViewKey)
            NotificationCenter.default.post(name: name, object: nil)
            
        } else if navigationItem.title == "Funguses Test Final" {
            name = Notification.Name(rawValue: TestViewKeys.fungusesViewKey)
            NotificationCenter.default.post(name: name, object: nil)
        }
    }
    
    private func showRatesController() {
        if navigationItem.title == "Viruses Test" {
            RateManager.showRatesController()
        }
    }
    
    //MARK: Sharing
    @IBAction func sharing(_ sender: Any) {
        share()
        shareAudio()
    }
    
    private func shareAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1001))
    }
    
    private func share() {
        let string = navigationItem.title
        
        fastActivityVCforTest(item: string ?? .init())
    }
    
    private func fastActivityVCforTest(item: String) {
        let activityVC = UIActivityViewController(activityItems: [item], applicationActivities: nil)
                activityVC.popoverPresentationController?.sourceView = self.view
            
        UIApplication.shared.keyWindow?.tintColor = lazyColor
            
        present(activityVC, animated: true)
    }

    private func otherUIthings() {
        stepperOutlet.stepperBaics()
        shareButton.isEnabled = false
        answerLabel.text = answerWord
    }
}


