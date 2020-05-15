//
//  ChomistaViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 20.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import GoogleMobileAds

final class ChomistaViewController: UIViewController {

    // Google ADMob Banner
    var interstitial: GADInterstitial!
    
    // ViewModel
    let viewModel = ChomistaViewControllerViewModel()
    
    // MARK: IBOutlets
    // ChromistaButtons
    @IBOutlet weak var sizeButton:   ChromistaButton!
    @IBOutlet weak var hideButton:   ChromistaButton!
    @IBOutlet weak var searchButton: ChromistaButton!
    
    // ChromistaActionButtonsBacks
    @IBOutlet weak var sizeButtonBack:      ChromistaActionButtonsBack!
    @IBOutlet weak var hideButtonBack:      ChromistaActionButtonsBack!
    @IBOutlet weak var searchButtonBack:    ChromistaActionButtonsBack!

    // UITextViews
    @IBOutlet weak var textView:            UITextView!
    @IBOutlet weak var structureTextView:   UITextView!
    @IBOutlet weak var historyTextView:     UITextView!
    
    // ContentBacks
    @IBOutlet weak var textViewBack:             ContentBack!
    @IBOutlet weak var structureTextViewBack:    ContentBack!
    @IBOutlet weak var historyTextViewBack:      ContentBack!
    
    // structureLabels
    @IBOutlet weak var structureLabel:  ChromistaLabel!
    
    // stepperView
    @IBOutlet weak var stepperView: UIView!
    @IBOutlet weak var stepper:     UIStepper!
    
    // switchView
    @IBOutlet weak var switchOutlet:    UISwitch!
    @IBOutlet weak var switchView:      UIView!
    @IBOutlet weak var switchTextView:  UITextView!
    
    // UIBarButtonItems
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    // UISegmentedControls
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        finalView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let views = [sizeButtonBack, searchButtonBack, hideButtonBack]
        for (index, view) in views.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                view?.alpha = 1
            })        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let views = [self.textViewBack,
                         self.structureLabel,
                         self.structureTextViewBack,
                         self.historyTextViewBack,
                         self.segmentedControl]
            for (index, view) in views.enumerated() {
                let delay: Double = Double((index)) * 0.2
                
                UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                    view?.alpha = 1
                })
            }
        }
    }

    //MARK: Action
    @IBAction func editButton(_ sender: Any) {
        if switchView.isHidden == false {
            viewModel.setEditorsViewHideen_forShowingMethods(switchView, hidden: true)
        } else {
            viewModel.setEditorsViewHideen_forShowingMethods(switchView, hidden: false)
        }
    }
    
    @IBAction func shareContent(_ sender: Any) {
        let acVC = UIActivityViewController(activityItems:
        [
"""
            \(textView.text!)
            
            \(structureTextView.text!)
            
            \(historyTextView.text!)
"""
        ], applicationActivities: nil)
        
        UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        present(acVC, animated: true)
        
        /// For Analytics
        AnalyticsManeger.addShareActionAnalytics(for: articleName)
    }
    
    @IBAction func settingsButtonAction(_ sender: Any) {
        if stepperView.isHidden == true {
            viewModel.setEditorsViewHideen_forShowingMethods(stepperView, hidden: false)
        } else {
            viewModel.setEditorsViewHideen_forShowingMethods(stepperView, hidden: true)
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
        let font  = textView.font?.fontName
        let font1 = historyTextView.font?.fontName
        let font2 = structureTextView.font?.fontName
        
        let fontSize = CGFloat(sender.value)
        
        textView.font           = UIFont(name: font!, size: fontSize)
        historyTextView.font    = UIFont(name: font1!, size: fontSize)
        structureTextView.font  = UIFont(name: font2!, size: fontSize)
        
        /// Analytics
        AnalyticsManeger.addArtcileChangeFontAnalytics(article: articleName)
    }
    
    @IBAction func contentSwitch(_ sender: UISegmentedControl) {
        /// ArticlesViewCountProtocol
        setPopularityVoit()
        
        /// Set Content
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            contentSetup()
        case 1:
            textView.text = ChromistaData.ChromistaViewControllerData.BasicsData.chromistaDataBasics
            structureTextView.text = ChromistaData.ChromistaViewControllerData.BasicsData.chromistaBiologyDataBasics
            historyTextView.text = ChromistaData.ChromistaViewControllerData.BasicsData.chromistaHistoryDataBasics
        default:
            break
        }
    }
}

extension ChomistaViewController {
    private func stepperViewPrefering() {
        stepperView.editorsViews()
        stepper.stepperBaics()
    }
    
    private func switchViewPrefering() {
        viewModel.chromistaVC_switchViewPropertiesSetup(switchOutlet: switchOutlet, back: switchView)
        
        switchView.editorsViews()
        switchOutlet.switchBasics()
        
        switchTextView.mainTextViewTextColor(alpha: 1)
        switchTextView.textViewShadow()
        switchTextView.switchTextViewPrefering()
    }
    
    private func segmentedControlSetup() {
        segmentedControl.segmentedControlShadow()
        segmentedControl.segmentedControlBasics()
    }
}

extension ChomistaViewController: ChomistaViewControllerViewSetupProtocol {
    
    func alphaSetup() {
        viewModel.alphaSetup(historyTextViewBack)
        viewModel.alphaSetup(textViewBack)
        viewModel.alphaSetup(structureTextViewBack)
    }
    
    func cornersSetup() {
        viewModel.cornersSetup(textView)
        viewModel.cornersSetup(structureTextView)
        viewModel.cornersSetup(historyTextView)
        
        viewModel.cornersSetup(textViewBack)
        viewModel.cornersSetup(structureTextViewBack)
        viewModel.cornersSetup(historyTextViewBack)
    }
    
    func shadowsSetup() {
        viewModel.setTextViewShadow(textView)
        viewModel.setTextViewShadow(structureTextView)
    }
    
    func backViewSetup() {
        viewModel.backViewSetup(mainView: view, navController: navigationController!)
    }
    
    func contentSetup() {
        viewModel.contentSetup(textView, content: ChromistaData.ChromistaViewControllerData.AllData.chromistaData)
        viewModel.contentSetup(structureTextView, content: ChromistaData.ChromistaViewControllerData.AllData.chromistaBiologyData)
        viewModel.contentSetup(historyTextView, content: ChromistaData.ChromistaViewControllerData.AllData.chromistaHistoryData)
    }
}

extension ChomistaViewController: ArticlesViewControllerDelegate {
    var articleName: String { get { return "Chromista" } }
    
    func finalView() {
        shadowsSetup()
        cornersSetup()
        alphaSetup()
        segmentedControlSetup()
        switchViewPrefering()
        stepperViewPrefering()
        backViewSetup()
        contentSetup()
    }
}
