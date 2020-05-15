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
    /// Public
    public var falseTint = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.798640839)
    
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
        setupViewDidApearAnimation()
    }
    
    override func viewWillLayoutSubviews() {
        gradient.setupRootViewsWithBasicGradient(mainView: view, scrollView: nil)
    }
}


