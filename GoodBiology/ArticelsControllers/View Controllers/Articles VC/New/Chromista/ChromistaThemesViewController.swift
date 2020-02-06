//
//  ChromistaThemesTableViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 21.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

struct ChromistaData {
    //ChromistaTitles
    static var chromistaTitle = ["Chromophycées (Chadefaud, 1950", "Chromophyta (Christensen 1962, 1989)", "Chromophyta (Bourrelly, 1968)", "Chromista (Cavalier-Smith, 1981)", "Chromalveolata (Adl et al., 2005)", "Chromista (Cavalier-Smith, 2010)"]
    
    //Content in Text View
    static var chromistaContent = ["The Chromophycées (Chadefaud, 1950), renamed Chromophycota (Chadefaud, 1960), included the current Ochrophyta (autotrophic Stramenopiles), Haptophyta (included in Chrysophyceae until Christensen, 1962), Cryptophyta, Dinophyta, Euglenophyceae and Choanoflagellida (included in Chrysophyceae until Hibberd, 1975).", "The Chromophyta (Christensen 1962, 1989), defined as algae with chlorophyll c, included the current Ochrophyta (autotrophic Stramenopiles), Haptophyta, Cryptophyta, Dinophyta and Choanoflagellida. The Euglenophyceae were transferred to the Chlorophyta.", "The Chromophyta (Bourrelly, 1968) included the current Ochrophyta (autotrophic Stramenopiles), Haptophyta and Choanoflagellida. The Cryptophyceae and the Dinophyceae were part of Pyrrhophyta (= Dinophyta).", "The Chromista (Cavalier-Smith, 1981) included the current Stramenopiles, Haptophyta and Cryptophyta.", "The Chromalveolata (Cavalier-Smith, 1981) included Stramenopiles, Haptophyta, Cryptophyta and Alveolata.", "The Chromista (Cavalier-Smith, 2010) included SAR (Stramenopiles, Alveolata and Rhizaria) and Hacrobia (Haptista, Cryptista). A new classification of classes and phyla within Chromista was proposed by Cavalier-Smith in 2017."]
    
    //Years And Titles
    static var years = ["1950", "1962, 1989", "1968", "1981", "2005", "2010"]
    
    //Index
    static var chromistaIndex = 0
}

class ChromistaThemesViewController: UIViewController, ArticlesViewControllerDelegate {

    @IBOutlet weak var stepperButtonBack:   ChromistaActionButtonsBack!
    @IBOutlet weak var stepperButton:       ChromistaButton!
    
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var contentBack:     ContentBack!
    
    @IBOutlet weak var stepperView: UIView!
    @IBOutlet weak var stepper:     UIStepper!
    
    @IBOutlet weak var label: ChromistaLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       finalView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let views = [self.label,
                     self.contentBack,
                     self.stepperButtonBack]
        for (index, view) in views.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                view?.alpha = 1
            })
        }
    }
    
    func finalView() {
        shadowsSetup()
        buttonTintSetup()
        contentSetup()
        cornersSetup()
        alpha()
    }
    
    private func cornersSetup() {
        contentTextView.layer.cornerRadius = 20
    }
    
    private func contentSetup() {
        contentTextView.text    = ChromistaData.chromistaContent[ChromistaData.chromistaIndex]
        label.text              = ChromistaData.chromistaTitle[ChromistaData.chromistaIndex]
        navigationItem.title    = ChromistaData.years[ChromistaData.chromistaIndex]
    }
    
    private func alpha() {
        let alpha = 0
        
        contentBack.alpha = CGFloat(alpha)
    }
    
    private func shadowsSetup() {
        stepperView.viewShadows()
        stepperButtonBack.viewShadows()
        
        contentTextView.textViewShadow()
    }
    
    private func buttonTintSetup() {
        stepperButton.tintColor = lazyColor
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        let font       = contentTextView.font?.fontName
        let fontSize   = CGFloat(sender.value)
        
        contentTextView.font           = UIFont(name: font!, size: fontSize)
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
}
