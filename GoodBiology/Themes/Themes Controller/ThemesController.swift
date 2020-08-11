//
//  ThemesController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 2/12/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

final class ThemesController: UIViewController {
    
    //MARK: ViewModel
    let viewModel = ThemesControllersViewModel()
    
    
    //MARK: @IBOutles
    @IBOutlet weak var contentBackground: UIView!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var stepperViewShowingButton: UIBarButtonItem!
    @IBOutlet weak var stepperView: UIView!
    @IBOutlet weak var stepper: UIStepper!
    
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalView()
        systemColorPrefering()
        navControllerSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.viewDidAppearAnimationSetup(back: contentBackground)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setTabBarHidden(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        setTabBarHidden(false)
    }
}



// MARK: - ArticlesViewControllerDelegate
extension ThemesController: ArticlesViewControllerDelegate {
    var articleName: String {
        get { return "Themes" }
    }
    
    func finalView() {
        rate()
        cornerGiven()
        contentGiven()
        basicView()
    }
}



// MARK: - @IBAction
extension ThemesController {
    @objc func shareContentGiven() {
        if let text = contentTextView.text {
            fastActivityVC(content: text)
        } else { return }
    }
    
    @objc func stepperViewShowing() {
        viewModel.stepperViewHiddenSetup(stepperView: stepperView)
    }
    
    @IBAction func stepperViewShowing(_ sender: Any) {
        viewModel.stepperViewHiddenSetup(stepperView: stepperView)
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        viewModel.contentFontChange(contentTextView: contentTextView, stepper: sender)
        
        /// For Analytics
        AnalyticsManeger.addArtcileChangeFontAnalytics(article: articleName)
    }
    
    @IBAction func share(_ sender: Any) {
        shareContentGiven()
        
        /// For Analytics
        AnalyticsManeger.addShareActionAnalytics(for: articleName)
    }
}



//MARK: - Main Functions
extension ThemesController {
    
    //MARK: Private
    private func fastActivityVC(content: String) {
        viewModel.fastActivityVC(content: content, vc: self)
    }
    
    private func basicView() {
        contentTextViewSetup()
        stepperViewSetup()
        contentBackgroundSetup()
    }
    
    private func rate() {
        viewModel.checkForRatesEnabled(navIten: navigationItem, rateFunc: {
            RateManager.showRatesController()
        })
    }
    
    private func cornerGiven() {
        let cornerRadius: CGFloat = 20
        
        viewModel.viewCornersSetup(view: contentBackground, corners: cornerRadius)
        viewModel.viewCornersSetup(view: contentTextView, corners: cornerRadius)
    }
    
    private func contentTextViewSetup() {
        viewModel.contentTextViewSetup(contentTextView: contentTextView)
    }
    
    private func contentBackgroundSetup() {
        contentBackground.viewShadows()
        viewModel.viewAlphaSetup(view: contentBackground, alpha: 0)
    }
    
    private func stepperViewSetup() {
        stepperView.editorsViews()
        stepperSetup()
    }
    
    private func stepperSetup() {
        stepper.stepperBaics()
    }
    
    private func systemColorPrefering() {
        view.viewSystemBack()
        contentBackground.viewSystemBack()
        stepperView.viewSystemBack()
    }
    
    private func navControllerSetup() {
        let stepperViewShowingButton = UIBarButtonItem(image: UIImage(systemName: "textformat.size"), style: .plain, target: self, action: #selector(stepperViewShowing(_:)))
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareContentGiven))
        let buttons = [stepperViewShowingButton, shareButton]
        
        viewModel.navItemSetup(buttons: buttons, navItem: navigationItem)
    }
}
