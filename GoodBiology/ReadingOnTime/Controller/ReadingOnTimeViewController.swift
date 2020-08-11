//
//  ReadingOnTimeViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 3/18/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

//MARK: DaneFunctionsSetup protocol
protocol DaneFunctionsSetup {
    /// Fast Alert Making Beacouse default is without actions
    /// - Parameters:
    /// - title: set title for Alert
    /// - message: set message for Alert
    func showAlert(title: String?, message: String?)
    
    func resultsSetup()
    func otherUIElementsSetup()
    func setScores()
}



//MARK: ReadingOnTimeViewController main class
final class ReadingOnTimeViewController: UIViewController {
    
    //MARK: Score properties
    private var score = 0
    private var scoreArray: [Int] = []
    
    
    //MARK: Alert TextView
    private let alertTextView = UITextView(frame: CGRect.zero)
    
    
    // MARK: - @IBOutlets
    @IBOutlet weak var addCostomArticleButton: AddCostomArticleButton!
    
    //doneButton
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var buttonsBackView: ReadingOnTimeViewControllerButtonsBackView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var contentBackground: UIView!
    @IBOutlet weak var startButton: ReadingOnTimeViewControllerControllButton!
    @IBOutlet weak var stopButton:  ReadingOnTimeViewControllerControllButton!
    @IBOutlet weak var resetButton: ReadingOnTimeViewControllerControllButton!
    @IBOutlet weak var newArticleButton: UIButton! {
        didSet {
            newArticleButton.fastButtonCostomizing(background: .biologyGreenColor, titleColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), title: "Change Card", corner: 16, borderWidth: 4)
        }
    }
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    
    //MARK: Score @IBOutlets
    //MARK: ContentBack
    @IBOutlet weak var scoreViewShowButtonBack: ReadingOnTimeViewControllerScoreView!
    
    //MARK: Showing Button
    @IBOutlet weak var scoreViewShowButton: UIButton!
    
    //MARK: ContentBack
    @IBOutlet weak var scoreView: ReadingOnTimeViewControllerScoreView! { didSet { scoreView.isHidden = true } }
    
    //MARK: ReadingOnTimeScoreLabels
    @IBOutlet weak var timeResultLbael:     ReadingOnTimeScoreLabel!
    @IBOutlet weak var articlesLabel:       ReadingOnTimeScoreLabel!
    @IBOutlet weak var allTimeScoresLabel:  ReadingOnTimeScoreLabel!
    @IBOutlet weak var worstTimeScoreLabel: ReadingOnTimeScoreLabel!
    @IBOutlet weak var bestTimeScoreLabel:  ReadingOnTimeScoreLabel!
    @IBOutlet weak var bestTimeScoresLabel: ReadingOnTimeScoreLabel!
    
    
    //MARK: Private
    private let alpha = CGFloat(1)
    
    private var timer = Timer()
    private var time  = 0
    
    
    //MARK: Static
    static var articles = [plantsROT, animalsROT, archaeROT, microbesROT, virusesROT, fungusRot, manROT, biologyROT, biology2ROT, biology3ROT, biology4ROT, biology5ROT, biology6ROT, biology7ROT, biology8ROT, biology9ROT, biology10ROT, biology11ROT, biology12ROT, biology13ROT, biology14ROT, biology15ROT, biology16ROT]
    
    
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        basicView()
        basicUIobjectsAlphaPrefering(alpha: 0)
        systemBackground()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let objectsArray = [resultLabel ,contentBackground, buttonsBackView, contentTextView, startButton, resetButton, stopButton, newArticleButton]
        
        for (index, objects) in objectsArray.enumerated() {
            let delay: Double = Double((index)) * 0.3
            
            UIView.animate(withDuration: 0.297, delay: delay, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveLinear, animations: {
                
                objects?.alpha = 1
            })
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "bounds"{
            if let rect = (change?[NSKeyValueChangeKey.newKey] as? NSValue)?.cgRectValue {
                
                /// Set alertTextView frame
                let margin:CGFloat = 8.0
                alertTextView.frame = CGRect.init(x: rect.origin.x + margin, y: rect.origin.y + margin, width: rect.width - 2*margin, height: rect.height / 2)
                alertTextView.bounds = CGRect.init(x: rect.origin.x + margin, y: rect.origin.y + margin, width: rect.width - 2*margin, height: rect.height / 2)
            }
        }
    }
}




//MARK: - @IBActions
extension ReadingOnTimeViewController {
    
    // MARK: Add Card Function
    @IBAction func addCard(_ sender: Any) {
        /// setup alertTextView
        setupAlertTextView()
        
        /// main UIAlertController
        let alertController = UIAlertController(title: "Your Сard", message: "Here you can write your card.", preferredStyle: .alert)

        /// UIAlertAction - saveAction
        let saveAction = UIAlertAction(title: "Add", style: .default) { (action) in
            alertController.view.removeObserver(self, forKeyPath: "bounds")
            self.setupAddCardAlert()
        }

        /// Set saveAction enabled
        saveAction.isEnabled = false

        /// UIAlertAction - cancelAction
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .default) { (action) in
            alertController.view.removeObserver(self, forKeyPath: "bounds")
        }
        alertController.view.addObserver(self, forKeyPath: "bounds", options: NSKeyValueObservingOptions.new, context: nil)

        /// Add Observer
        NotificationCenter.default.addObserver(forName: UITextView.textDidChangeNotification, object: alertTextView, queue: OperationQueue.main) { (notification) in
            saveAction.isEnabled = self.alertTextView.text != ""
        }

        /// Add alertTextView
        alertController.view.addSubview(self.alertTextView)
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }

    private func setupAddCardAlert() {
        /// main UIAlertController
        let addCardAlert = UIAlertController(title: "What do you want to do with your card ?", message: nil, preferredStyle: .alert)
        
        /// UIAlertAction - putInArray
        let putInArray = UIAlertAction(title: "Put your card in cards array", style: .default) { (_) in
            ReadingOnTimeViewController.articles.append(self.alertTextView.text!)
        }
        
        /// UIAlertAction - readItNow
        let readItNow = UIAlertAction(title: "Read it now", style: .default) { (_) in
            self.contentTextView.text = self.alertTextView.text!
        }
        
        /// UIAlertAction - readItNowAndPutItInArray
        let readItNowAndPutItInArray = UIAlertAction(title: "Read it now and put it into cards array", style: .cancel) { (_) in
            ReadingOnTimeViewController.articles.append(self.alertTextView.text!)
            self.contentTextView.text = self.alertTextView.text!
        }
        
        /// Add Actions
        addCardAlert.addAction(readItNowAndPutItInArray)
        addCardAlert.addAction(putInArray)
        addCardAlert.addAction(readItNow)
        
        /// Present
        self.present(addCardAlert, animated: true, completion: nil)
    }
    
    //MARK: Done Function
    @IBAction func done(_ sender: Any) {
        scoreArray.append(time)
        let sumArray = scoreArray.reduce(0, +)
        let avgArrayValue = sumArray / scoreArray.count
        let allTimeScoresLabelMainText = "All scores in seconds: "
        allTimeScoresLabel.text = allTimeScoresLabelMainText + scoreArray.map { String($0) }.joined(separator: ", ")
        if let max = scoreArray.max() {
            let mainFrase = "Worst time score: "
            if max != 1 {
                worstTimeScoreLabel.text = mainFrase + String(max) + " Seconds"
            } else {
                worstTimeScoreLabel.text = mainFrase + "1 Second"
            }
        }
        if let min = scoreArray.min() {
            let mainFrase = "Best time score: "
            if min != 1 {
                bestTimeScoreLabel.text = mainFrase + String(min) + " Seconds"
            } else {
                bestTimeScoreLabel.text = mainFrase + "1 Second"
            }
        }
        //bestTimeScoresLabel.text = String((scoreArray.filter { $0 <= avgArrayValue }))
        resultsSetup()
        otherUIElementsSetup()
    }
    
    @IBAction func scoreViewShow(_ sender: Any) {
        if scoreView.isHidden == true {
            scoreView.isHidden = false
        } else {
            scoreView.isHidden = true
        }
    }
    
    @IBAction func share(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [contentTextView.text!], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        
            UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        self.present(activityVC, animated: true, completion: nil)
    }

    @IBAction func start(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ReadingOnTimeViewController.action), userInfo: nil, repeats: true)
        startButton.isEnabled = false
        startButton.alpha     = 0.5
        
        doneButton.isEnabled = true
    }
    
    @objc func action() {
        time += 1
        resultLabel.text = String("\(time) Seconds")
    }
    
    @IBAction func stop(_ sender: UIButton) {
        timer.invalidate()
        startButton.isEnabled = true
        startButton.alpha     = alpha
        doneButton.isEnabled = false
    }
    
    @IBAction func reset(_ sender: UIButton) {
        timer.invalidate()
        time                = 0
        resultLabel.text    = "0 Seconds"
        startButton.isEnabled = true
        startButton.alpha     = alpha
        doneButton.isEnabled = false
    }
    
    @IBAction func newArticle(_ sender: UIButton) {
        timer.invalidate()
        time                = 0
        resultLabel.text    = "Let's Start"
        startButton.isEnabled = true
        startButton.alpha     = alpha
        contentTextView.text = ReadingOnTimeViewController.articles.randomElement()
        doneButton.isEnabled = false
    }
}




//MARK: - DaneFunctionsSetup
extension ReadingOnTimeViewController: DaneFunctionsSetup {
    func setScores() {
        
        /// Set Articles Score
        let articlesScoreText = "Number of cards already read:"
        
        score += 1
        articlesLabel.text = articlesScoreText + " " + String(score)
        
        /// Set time Score
        let timeLabelText = "Last time score:"
        
        timeResultLbael.text = timeLabelText + " " + String(time) + " Seconds"
    }
    
    func showAlert(title: String?, message: String?) {
        
        /// AlertVC Action Alert Show
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.setMessage(font: UIFont(name: BasicFonts.mediumFont, size: 12), color: UIColor.black)
        
        /// AlertVC Continue Action
        let continueAction = UIAlertAction(title: "Continue", style: .cancel, handler: nil)
        
        /// AlertVC New Article Set Action
        let newCard = UIAlertAction(title: "Put a new card", style: .default, handler: { (_) in
            self.contentTextView.text = ReadingOnTimeViewController.articles.randomElement()
        })
        
        /// Set Tint Color
        alertVC.view.tintColor = .biologyGreenColor
        
        /// Adding Actions
        alertVC.addAction(newCard)
        alertVC.addAction(continueAction)
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func resultsSetup() {
        setScores()
        
        /// Set Congratulations
        if time <= 5 {
            
            /// if user has unpossible result
            showAlert(title: "🤥", message: "Are you sure you could read the card so quickly ?")
            
        } else if time <= 10 {
            showAlert(title: "🤓", message: "Cool, you did it really fast !")
            
        } else if time < 20 {
            
            /// if user has very cool result
            showAlert(title: "🥳", message: "Very good result !")
            
        } else if time >= 70 {
            
            /// if user has bad result
            showAlert(title: "😬", message: "You do not read too fast. Perhaps you need to practice more ?")
            
        } else {
            /// if user has okey result
            showAlert(title: "🤗", message: "\(resultLabel.text!) - is good result !")
        }
    }
    
    func otherUIElementsSetup() {
        time = 0
        timer.invalidate()
        resultLabel.text = "Let's Start"
        doneButton.isEnabled    = false
        startButton.isEnabled   = true
        startButton.alpha = 1
    }
}




//MARK: - Main Functions
extension ReadingOnTimeViewController {
    private func systemBackground() {
        if #available(iOS 13.0, *) {
            contentBackground.viewSystemBack()
            
            view.viewSystemBack()
        }
    }
    
    private func setupAlertTextView() {
        alertTextView.backgroundColor = UIColor.white
        alertTextView.layer.cornerRadius = 12
    }
    
    private func basicView() {
        resultLabelTextPrefering()
        contentBackgroundPrefering()
        textViewPrefering()
    }
    
    private func resultLabelTextPrefering() {
        resultLabel.text = "Let's Start"
        doneButton.isEnabled = false
    }
    
    private func contentBackgroundPrefering() {
        contentBackground.layer.cornerRadius = 8
        contentBackground.viewShadows()
        contentBackground.layer.shadowColor  = #colorLiteral(red: 0.7812698287, green: 0.7812698287, blue: 0.7812698287, alpha: 1)
        contentBackground.layer.shadowRadius = 2.8
    }
    
    private func textViewPrefering() {
        contentTextView.text = ReadingOnTimeViewController.articles.randomElement()
        contentTextView.bigContentTextViewsPrefering(size: 16)
    }
    
    private func basicUIobjectsAlphaPrefering(alpha: CGFloat) {
        resultLabel.alpha       = alpha
        contentBackground.alpha = alpha
        contentTextView.alpha   = alpha
        startButton.alpha       = alpha
        stopButton.alpha        = alpha
        resetButton.alpha       = alpha
        newArticleButton.alpha  = alpha
    }
}
