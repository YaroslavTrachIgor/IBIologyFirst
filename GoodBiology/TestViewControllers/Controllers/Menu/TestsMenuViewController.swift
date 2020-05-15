//
//  TestsMenuViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/14/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import AudioToolbox
import GoogleMobileAds

extension TestsMenuViewController: PlantsViewControllerAdMobBannerSetupProtocol {
    func showBunner() {
        if interstitial.isReady {
          interstitial.present(fromRootViewController: self)
        }
    }
    
    func setupBanner() {
        let request = GADRequest()
        
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-8702634561077907/3602528777")
        interstitial.load(request)
    }
}

final class TestsMenuViewController: UIViewController {
    
    // Gradient
    let gradient: BasicRootVCGradient = BasicRootVCGradient(color: #colorLiteral(red: 0.9783470812, green: 0.9783470812, blue: 0.9783470812, alpha: 1))
    
    // Google ADMob Banner
    var interstitial: GADInterstitial!
    
    // MARK: IBOutlets
    // Background Views
    @IBOutlet weak var plantsView:      TestIconBackView!
    @IBOutlet weak var animalsView:     TestIconBackView!
    @IBOutlet weak var humanView:       TestIconBackView!
    @IBOutlet weak var microbesView:    TestIconBackView!
    @IBOutlet weak var virusesView:     TestIconBackView!
    @IBOutlet weak var fungusesView:    TestIconBackView!
    @IBOutlet weak var archaeaView:     TestIconBackView!
    
    // Text View
    @IBOutlet weak var plantsTextView:       UITextView!
    @IBOutlet weak var animalsTextView:      UITextView!
    @IBOutlet weak var manTextView:          UITextView!
    @IBOutlet weak var microbesTextView:     UITextView!
    @IBOutlet weak var virusesTextView:      UITextView!
    @IBOutlet weak var mushroomsTextView:    UITextView!
    @IBOutlet weak var archaeaTextView:      UITextView!
    
    // UILabel
    @IBOutlet weak var plantsTitle:     TestIconLabel!
    @IBOutlet weak var animalsLabel:    TestIconLabel!
    @IBOutlet weak var humanLabel:      TestIconLabel!
    @IBOutlet weak var microbesLabel:   TestIconLabel!
    @IBOutlet weak var virusLabel:      TestIconLabel!
    @IBOutlet weak var fungusesLabel:   TestIconLabel!
    @IBOutlet weak var archaeaLabel:    TestIconLabel!
    
    // Info Button
    @IBOutlet weak var infoButton:     UIButton!
    @IBOutlet weak var infoButtonBack: ChromistaActionButtonsBack!
    
    // UIScrollView
    @IBOutlet weak var scrollView: UIScrollView!
    
    // UIBarButtonItem
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    private let settingsRefreshControl: UIRefreshControl = {
        let refreshControl = BasicRefreshControl()
        
        return refreshControl
    }()
    
    private let searchController = BasicSearchController()
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    struct Names {
        static let plantsName   = Notification.Name(rawValue: TestViewKeys.plantsViewKey)
        static let archaeaName  = Notification.Name(rawValue: TestViewKeys.archaeaViewKey)
        static let animalsName  = Notification.Name(rawValue: TestViewKeys.animalsViewKey)
        static let humenName    = Notification.Name(rawValue: TestViewKeys.humanViewKey)
        static let virusesName  = Notification.Name(rawValue: TestViewKeys.virusesViewKey)
        static let microbesName = Notification.Name(rawValue: TestViewKeys.microbesViewKey)
        static let fungusesName = Notification.Name(rawValue: TestViewKeys.fungusesViewKey)
    }
    
    // ViewModel
    let viewModel = TestsMenuViewControllerViewModel()
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// MenuViewControllerDelegate
        basicViewProccesPrefering()
        createObservers()
        
        setupBanner()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let views = [plantsView, animalsView, humanView, microbesView, virusesView, archaeaView, fungusesView, infoButtonBack]
        
        viewModel.animationPriview(views as! [UIView])
    }
    
    override func viewWillLayoutSubviews() {
        gradient.setupRootViewsWithBasicGradient(mainView: view, scrollView: scrollView)
    }
}



// MARK: - UISearchResultsUpdating
extension TestsMenuViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {}
}



// MARK: - MenuViewControllerDelegate
extension TestsMenuViewController: MenuViewControllerDelegate {
    func basicViewProccesPrefering() {
        view.viewGradient()
        
        textPrefering()
        preferingSearchContrller()
        viewsShadowsPrefering()
        systemColorsPrefeing()
        refreshControlPrefering()
        searchBarButtonPrefering()
        setupSearchBarFont()
        setupNavigationController()
    }
}



// MARK: - Main Functions
extension TestsMenuViewController {
    
    //MARK: DarkMode methods Prefering
    private func systemColorsPrefeing() {
        systemTextViewColorsPrefering()
        systemViewPrefering()
        systemScrollViewPrefering()
    }
    
    //MARK: UITextView
    private func systemTextViewColorsPrefering() {
        viewSystemBack()
        systemTextColor()
        textViewShadowSetup()
    }
    
    private func viewSystemBack() {
        viewModel.viewSystemBack(plantsTextView)
        viewModel.viewSystemBack(animalsTextView)
        viewModel.viewSystemBack(virusesTextView)
        viewModel.viewSystemBack(microbesTextView)
        viewModel.viewSystemBack(manTextView)
        viewModel.viewSystemBack(mushroomsTextView)
        viewModel.viewSystemBack(archaeaTextView)
    }
    
    private func systemTextColor() {
        viewModel.systemTextColor(plantsTextView)
        viewModel.systemTextColor(animalsTextView)
        viewModel.systemTextColor(virusesTextView)
        viewModel.systemTextColor(microbesTextView)
        viewModel.systemTextColor(manTextView)
        viewModel.systemTextColor(mushroomsTextView)
        viewModel.systemTextColor(archaeaTextView)
    }
    
    private func textViewShadowSetup() {
        viewModel.textViewShadowSetup(plantsTextView)
        viewModel.textViewShadowSetup(animalsTextView)
        viewModel.textViewShadowSetup(virusesTextView)
        viewModel.textViewShadowSetup(microbesTextView)
        viewModel.textViewShadowSetup(manTextView)
        viewModel.textViewShadowSetup(mushroomsTextView)
        viewModel.textViewShadowSetup(archaeaTextView)
    }
    
    private func systemScrollViewPrefering() {
        viewModel.systemViewPrefering(view)
        viewModel.systemViewPrefering(scrollView)
    }
    
    //MARK: UIView
    private func systemViewPrefering() {
        viewModel.systemViewPrefering(plantsView)
        viewModel.systemViewPrefering(animalsView)
        viewModel.systemViewPrefering(microbesView)
        viewModel.systemViewPrefering(archaeaView)
        viewModel.systemViewPrefering(fungusesView)
        viewModel.systemViewPrefering(humanView)
        viewModel.systemViewPrefering(virusesView)
    }
    
    private func preferingSearchContrller() {
        searchController.searchResultsUpdater = self
        viewModel.preferingSearchContrller(vc: self, searchController: searchController)
    }
    
    private func viewsShadowsPrefering() {
        viewModel.viewsShadowsPrefering(plantsTextView)
        viewModel.viewsShadowsPrefering(animalsTextView)
        viewModel.viewsShadowsPrefering(microbesTextView)
        viewModel.viewsShadowsPrefering(manTextView)
        viewModel.viewsShadowsPrefering(virusesTextView)
        viewModel.viewsShadowsPrefering(archaeaTextView)
        viewModel.viewsShadowsPrefering(mushroomsTextView)
    }
    
    private func textPrefering() {
        viewModel.textViewFontSetup(plantsTextView)
        viewModel.textViewFontSetup(animalsTextView)
        viewModel.textViewFontSetup(microbesTextView)
        viewModel.textViewFontSetup(manTextView)
        viewModel.textViewFontSetup(virusesTextView)
        viewModel.textViewFontSetup(archaeaTextView)
        viewModel.textViewFontSetup(mushroomsTextView)
    }
    
    func setupNavigationController() {
        viewModel.setupNavigationController(self)
        viewModel.setupSearchBar(searchController.searchBar)
    }
    
    private func refreshControlPrefering() {
        viewModel.refreshControlPrefering(refreshControl: settingsRefreshControl, scrollView: scrollView)
    }
    
    private func searchBarButtonPrefering() {
        if let buttonItem = searchController.searchBar.subviews.first?.subviews.last as? UIButton {
            viewModel.searchBarButtonPrefering(buttonItem: buttonItem)
        }
    }
}




// MARK: - @IBActions
extension TestsMenuViewController {
    @IBAction func shareButton(_ sender: Any) {
        let activityVCItem: String = "Good Biology Menu Of Tests."
        
        viewModel.share(activityItems: [activityVCItem], self)
        shareButton.shareAudio()
        
        /// For Analytics
        AnalyticsManeger.addShareActionAnalytics(for: "TestsMenuViewController")
    }
    
    @IBAction func infoVCShow(_ sender: UIButton) {
        showBunner()
    }
}




// MARK: - Observers setup
extension TestsMenuViewController {
    //MARK: - Update Alpha After Test Ending
    //Update Views Alpha
    private func createObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(TestsMenuViewController.plantsViewAlphaUpdate(notification:)),
                                               name: Names.plantsName,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(TestsMenuViewController.archaeaViewAlphaUpdate(notification:)),
                                               name: Names.archaeaName,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(TestsMenuViewController.animalsViewAlphaUpdate(notification:)),
                                               name: Names.animalsName,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(TestsMenuViewController.humenViewAlphaUpdate(notification:)),
                                               name: Names.humenName,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(TestsMenuViewController.virusesViewAlphaUpdate(notification:)),
                                               name: Names.virusesName,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(TestsMenuViewController.fungusesViewAlphaUpdate(notification:)),
                                               name: Names.fungusesName,
                                               object: nil)
    }
    
    //Set Alpha For Special Views
    @objc func plantsViewAlphaUpdate(notification: NSNotification) {
        viewModel.setAlphaForViews(view: plantsView, label: plantsTitle, textView: plantsTextView)
    }
    
    @objc func archaeaViewAlphaUpdate(notification: NSNotification) {
        viewModel.setAlphaForViews(view: archaeaView, label: archaeaLabel, textView: archaeaTextView)
    }
    
    @objc func animalsViewAlphaUpdate(notification: NSNotification) {
        viewModel.setAlphaForViews(view: animalsView, label: animalsLabel, textView: animalsTextView)
    }
    
    @objc func humenViewAlphaUpdate(notification: NSNotification) {
        viewModel.setAlphaForViews(view: humanView, label: humanLabel, textView: manTextView)
    }
    
    @objc func virusesViewAlphaUpdate(notification: NSNotification) {
        viewModel.setAlphaForViews(view: virusesView, label: virusLabel, textView: virusesTextView)
    }
    
    @objc func microbesViewAlphaUpdate(notification: NSNotification) {
        viewModel.setAlphaForViews(view: microbesView, label: microbesLabel, textView: microbesTextView)
    }
    
    @objc func fungusesViewAlphaUpdate(notification: NSNotification) {
        viewModel.setAlphaForViews(view: fungusesView, label: fungusesLabel, textView: mushroomsTextView)
    }
}
