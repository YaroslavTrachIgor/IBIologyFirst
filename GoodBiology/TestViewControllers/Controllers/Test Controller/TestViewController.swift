//
//  TestViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/24/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import AudioToolbox
import Combine

struct TestViewKeys {
    static let plantsViewKey    = "PlantsViewKey"
    static let animalsViewKey   = "AnimalsViewKey"
    static let archaeaViewKey   = "ArchaeaViewKey"
    static let microbesViewKey  = "MicrobesViewKey"
    static let virusesViewKey   = "VirusesViewKey"
    static let humanViewKey     = "HumanViewKey"
    static let fungusesViewKey  = "FungusesViewKey"
}

class TestScores {
    static let shared = TestScores()
    
    private init() {}
    
    // Main Properties
    var testScore: Int = 0
    var doneButtonEnabled = true
}

final class TestViewController: UIViewController {
    
    // Gradient
    let gradient: BasicRootVCGradient = BasicRootVCGradient(color: #colorLiteral(red: 0.9783470812, green: 0.9783470812, blue: 0.9783470812, alpha: 1))
    
    // Notification for set alpha
    var notificationName = Notification.Name("")
    
    // MARK: IBOutlets
    // TestBackView
    @IBOutlet weak var testView:       TestBackView!
    @IBOutlet weak var secondTestView: TestBackView!
    
    // AnswerLabel
    @IBOutlet weak var answerLabel: AnswerLabel!
    
    // TestButton
    @IBOutlet weak var trueButtonOutlet:  TestButton!
    @IBOutlet weak var falseButtonOutlet: TestButton!
    private var falseTint = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.798640839)
    
    // Stepper VIew
    @IBOutlet weak var stepperView:    TestStepperView!
    @IBOutlet weak var stepperOutlet:  UIStepper!
    
    // TestTextView
    @IBOutlet weak var secondTextView: TestTextView!
    @IBOutlet weak var testTextView:   TestTextView!
    
    // TestUIBarButtonItem
    let barButtonsTint = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    @IBOutlet weak var stepperViewShower:       TestUIBarButtonItem! { didSet { stepperViewShower.setupTestUIBarButtonItemImageFast(image: "textformat.size") } }
    @IBOutlet weak var shareButton:             TestUIBarButtonItem! { didSet { shareButton.tintColor = barButtonsTint } }
    @IBOutlet weak var cancelButton:            TestUIBarButtonItem! { didSet { cancelButton.setupTestUIBarButtonItemImageFast(image: "arrow.clockwise") } }
    @IBOutlet weak var doneButton:              TestUIBarButtonItem! { didSet { doneButton.tintColor = barButtonsTint } }
    @IBOutlet weak var goToNextTestPageButton:  TestUIBarButtonItem! { didSet { goToNextTestPageButton.setupTestUIBarButtonItemImageFast(image: "chevron.right") } }
    
    // Test Score
    public var score: Int = 0 
    
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
    
    override func viewWillLayoutSubviews() {
        gradient.setupRootViewsWithBasicGradient(mainView: view, scrollView: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.statusBarStyle = .default
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
    }
    
    //MARK: Actions
    @IBAction func stepper(_ sender: UIStepper) {
        let font  = testTextView.font?.fontName
        let font2 = secondTextView.font?.fontName
        
        let fontSize  = CGFloat(sender.value)
        let fontSize2 = CGFloat(sender.value)
        
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
        trueButtonOutlet.setTitleColor(.biologyGreenColor, for: .normal)
        
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
        answerLabel.textColor   = .biologyGreenColor
        
        TestScores.shared.testScore += 10
    
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
            
            falseButtonOutlet.setTitleColor(.biologyGreenColor, for: .normal)
            falseButtonOutlet.layer.borderColor = #colorLiteral(red: 0.03378171101, green: 0.2793948948, blue: 0.1025686339, alpha: 1)
            falseButtonOutlet.testButtonsShadows()
            
            trueButtonOutlet.isEnabled  = true
            falseButtonOutlet.isEnabled = true
            
            shareButton.isEnabled       = false
            stepperViewShower.isEnabled = true
            
            trueButtonOutlet.alpha  = 1
            falseButtonOutlet.alpha = 1
            
            answerLabel.text = answerWord
            answerLabel.textColor = .secondaryLabel
        } catch {
            FastAlert.showBasic(title: "Unavailable", message: nil, vc: self)
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
        if TestScores.shared.testScore > 30 {
            FastAlert.showBasic(title: "30/30", message: nil, vc: self)
        } else {
            FastAlert.showBasic(title: "\(TestScores.shared.testScore)/30", message: nil, vc: self)
        }
        TestScores.shared.testScore = 0
        TestScores.shared.doneButtonEnabled = false
        doneButton.isEnabled = TestScores.shared.doneButtonEnabled
    }
    
    // MARK: Post Keys
    // Public
    func notificationCenterPost() {
        NotificationCenter.default.post(name: notificationName, object: nil)
    }
    
    func notificationNameSet(name: String) {
        notificationName = Notification.Name(name)
    }
    
    // MARK: Rates Controller
    // Private
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
            
        UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
            
        present(activityVC, animated: true)
    }
}
