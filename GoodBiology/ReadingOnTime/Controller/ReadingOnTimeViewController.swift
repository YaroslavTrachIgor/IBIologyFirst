//
//  ReadingOnTimeViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 3/18/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

class ReadingOnTimeViewController: UIViewController {

    @IBOutlet weak var buttonsBackView: ContentBack! {
        didSet {
            buttonsBackView.alpha = 0
        }
    }
    
    @IBOutlet weak var resultLabel:          UILabel!
    @IBOutlet weak var contentTextView:      UITextView!
    @IBOutlet weak var contentBackground:    UIView!
    
    @IBOutlet weak var startButton:          UIButton!
    @IBOutlet weak var stopButton:           UIButton!
    @IBOutlet weak var resetButton:          UIButton!
    @IBOutlet weak var newArticleButton:     UIButton!
    
    @IBOutlet weak var shareButton:          UIBarButtonItem!
    
    private let alpha = CGFloat(1)
    
    private var timer = Timer()
    private var time  = 0
    
    static var articles = [plantsROT, animalsROT, archaeROT, microbesROT, virusesROT, fungusRot, manROT, biologyROT, biology2ROT, biology3ROT, biology4ROT, biology5ROT, biology6ROT, biology7ROT, biology8ROT, biology9ROT, biology10ROT, biology11ROT, biology12ROT, biology13ROT, biology14ROT, biology15ROT, biology16ROT,]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        basicView()
        basicUIobjectsAlphaPrefering(alpha: 0)
        systemBackground()
        
        /// ReadingOnTimeButtosnProtocol
        preferingButtons()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let objectsArray = [resultLabel ,contentBackground, buttonsBackView, contentTextView, startButton, stopButton, resetButton, newArticleButton]
        
        for (index, objects) in objectsArray.enumerated() {
            let delay: Double = Double((index)) * 0.3
            
            UIView.animate(withDuration: 0.297, delay: delay, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveLinear, animations: {
                objects?.alpha = 1
            })
        }
    }
    
    @IBAction func share(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [contentTextView.text!], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        
            UIApplication.shared.keyWindow?.tintColor = lazyColor
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    private func preferingButtons() {
        
        //ReadingOnTimeButtonDelegate
        buttonStyle()
    }
    
    private func systemBackground() {
        if #available(iOS 13.0, *) {
            contentBackground.viewSystemBack()
            
            view.viewSystemBack()
        }
    }
    
    private func basicView() {
        resultLabelTextPrefering()
        contentBackgroundPrefering()
        textViewPrefering()
    }
    
    private func resultLabelTextPrefering() {
        resultLabel.text = "Let's Start"
    }
    
    private func contentBackgroundPrefering() {
        contentBackground.viewShadows()
        contentBackground.layer.cornerRadius = 13.5
    }
    
    private func textViewPrefering() {
        contentTextView.text = ReadingOnTimeViewController.articles.randomElement()
        contentTextView.bigContentTextViewsPrefering(size: 16)
    }
    
    private func basicUIobjectsAlphaPrefering(alpha: Int) {
        resultLabel.alpha       = CGFloat(alpha)
        contentBackground.alpha = CGFloat(alpha)
        contentTextView.alpha   = CGFloat(alpha)
        startButton.alpha       = CGFloat(alpha)
        stopButton.alpha        = CGFloat(alpha)
        resetButton.alpha       = CGFloat(alpha)
        newArticleButton.alpha  = CGFloat(alpha)
    }

    @IBAction func start(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ReadingOnTimeViewController.action), userInfo: nil, repeats: true)
        startButton.isEnabled = false
        startButton.alpha     = 0.5
    }
    
    @objc func action() {
        time += 1
        resultLabel.text = String("\(time) Seconds")
    }
    
    @IBAction func stop(_ sender: UIButton) {
        timer.invalidate()
        
        startButton.isEnabled = true
        startButton.alpha     = alpha
    }
    
    @IBAction func reset(_ sender: UIButton) {
        timer.invalidate()
        time                = 0
        resultLabel.text    = "0 Seconds"
        
        startButton.isEnabled = true
        startButton.alpha     = alpha
    }
    
    @IBAction func newArticle(_ sender: UIButton) {
        timer.invalidate()
        time                = 0
        resultLabel.text    = "Let's Start"
        
        startButton.isEnabled = true
        startButton.alpha     = alpha
        
        contentTextView.text = ReadingOnTimeViewController.articles.randomElement()
    }
}

extension ReadingOnTimeViewController: ReadingOnTimeButtosnProtocol {
    func buttonStyle() {
        cornerRadius = 14
        
        startButton.fastButtonCostomizing(background: ReadingOnTimeStyleVaribles.backColor,
                                          titleColor: ReadingOnTimeStyleVaribles.titleColor,
                                          title: "Start",
                                          corner: Float(cornerRadius),
                                          borderWidth: Float(ReadingOnTimeStyleVaribles.border))
        
        stopButton.fastButtonCostomizing(background: ReadingOnTimeStyleVaribles.backColor,
                                         titleColor: ReadingOnTimeStyleVaribles.titleColor,
                                         title: "Stop",
                                         corner: Float(cornerRadius),
                                         borderWidth: Float(ReadingOnTimeStyleVaribles.border))
        
        resetButton.fastButtonCostomizing(background: ReadingOnTimeStyleVaribles.backColor,
                                          titleColor: ReadingOnTimeStyleVaribles.titleColor,
                                          title: "Reset",
                                          corner: Float(cornerRadius),
                                          borderWidth: Float(ReadingOnTimeStyleVaribles.border))
        
        newArticleButton.fastButtonCostomizing(background: ReadingOnTimeStyleVaribles.backColor,
                                               titleColor: ReadingOnTimeStyleVaribles.titleColor,
                                               title: "New Article",
                                               corner: Float(cornerRadius),
                                               borderWidth: Float(ReadingOnTimeStyleVaribles.border))
    }
}
