//
//  TestsMenuViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/14/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import AudioToolbox

class TestsMenuViewController: UIViewController {
    
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
    
    let plantsName      = Notification.Name(rawValue: TestViewKeys.plantsViewKey)
    let archaeaName     = Notification.Name(rawValue: TestViewKeys.archaeaViewKey)
    let animalsName     = Notification.Name(rawValue: TestViewKeys.animalsViewKey)
    let humenName       = Notification.Name(rawValue: TestViewKeys.humanViewKey)
    let virusesName     = Notification.Name(rawValue: TestViewKeys.virusesViewKey)
    let microbesName    = Notification.Name(rawValue: TestViewKeys.microbesViewKey)
    let fungusesName    = Notification.Name(rawValue: TestViewKeys.fungusesViewKey)
    
    let viewAlphaAfterObserver: CGFloat = 0.8
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// MenuViewControllerDelegate
        basicViewProccesPrefering()
        createObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let views = [plantsView, animalsView, humanView, microbesView, virusesView, archaeaView, fungusesView]
        
        for (index, view) in views.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                view?.alpha = 1
            })
        }
    }
    
    //MARK: Update Alpha After Test Ending
    //Update Views Alpha
    private func createObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(TestsMenuViewController.plantsViewAlphaUpdate(notification:)),
                                               name: plantsName,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(TestsMenuViewController.archaeaViewAlphaUpdate(notification:)),
                                               name: archaeaName,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(TestsMenuViewController.animalsViewAlphaUpdate(notification:)),
                                               name: animalsName,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(TestsMenuViewController.humenViewAlphaUpdate(notification:)),
                                               name: humenName,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(TestsMenuViewController.virusesViewAlphaUpdate(notification:)),
                                               name: virusesName,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(TestsMenuViewController.fungusesViewAlphaUpdate(notification:)),
                                               name: fungusesName,
                                               object: nil)
    }
    
    //Set Alpha
    private func setAlphaForViews(view: UIView, label: UIView, textView: UIView) {
        view.alpha      = viewAlphaAfterObserver
        label.alpha     = viewAlphaAfterObserver
        textView.alpha  = viewAlphaAfterObserver
    }
    
    //Set Alpha For Special Views
    @objc func plantsViewAlphaUpdate(notification: NSNotification) {
        setAlphaForViews(view: plantsView, label: plantsTitle, textView: plantsTextView)
    }
    
    @objc func archaeaViewAlphaUpdate(notification: NSNotification) {
        setAlphaForViews(view: archaeaView, label: archaeaLabel, textView: archaeaTextView)
    }
    
    @objc func animalsViewAlphaUpdate(notification: NSNotification) {
        setAlphaForViews(view: animalsView, label: animalsLabel, textView: animalsTextView)
    }
    
    @objc func humenViewAlphaUpdate(notification: NSNotification) {
        setAlphaForViews(view: humanView, label: humanLabel, textView: manTextView)
    }
    
    @objc func virusesViewAlphaUpdate(notification: NSNotification) {
        setAlphaForViews(view: virusesView, label: virusLabel, textView: virusesTextView)
    }
    
    @objc func microbesViewAlphaUpdate(notification: NSNotification) {
        setAlphaForViews(view: microbesView, label: microbesLabel, textView: microbesTextView)
    }
    
    @objc func fungusesViewAlphaUpdate(notification: NSNotification) {
        setAlphaForViews(view: fungusesView, label: fungusesLabel, textView: mushroomsTextView)
    }
    
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
        plantsTextView.viewSystemBack()
        animalsTextView.viewSystemBack()
        virusesTextView.viewSystemBack()
        microbesTextView.viewSystemBack()
        manTextView.viewSystemBack()
        mushroomsTextView.viewSystemBack()
        archaeaTextView.viewSystemBack()
    }
    
    private func systemTextColor() {
        plantsTextView.systemTextColor()
        animalsTextView.systemTextColor()
        virusesTextView.systemTextColor()
        microbesTextView.systemTextColor()
        manTextView.systemTextColor()
        mushroomsTextView.systemTextColor()
        archaeaTextView.systemTextColor()
    }
    
    private func textViewShadowSetup() {
        plantsTextView.textViewShadow()
        animalsTextView.textViewShadow()
        virusesTextView.textViewShadow()
        microbesTextView.textViewShadow()
        manTextView.textViewShadow()
        mushroomsTextView.textViewShadow()
        archaeaTextView.textViewShadow()
        
        plantsTextView.layer.shadowRadius = 4
    }
    
    private func systemScrollViewPrefering() {
        view.viewSystemBack()
        
        scrollView.viewSystemBack()
    }
    
    //MARK: UIView
    private func systemViewPrefering() {
        plantsView.viewSystemBack()
        animalsView.viewSystemBack()
        microbesView.viewSystemBack()
        archaeaView.viewSystemBack()
        fungusesView.viewSystemBack()
        humanView.viewSystemBack()
        virusesView.viewSystemBack()
    }
    
    @IBAction func shareButton(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: ["Good Biology Menu Of Tests."], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            UIApplication.shared.keyWindow?.tintColor = lazyColor
        
        self.present(activityVC, animated: true, completion: nil)
        
        shareButton.shareAudio()
    }
    
    private func preferingSearchContrller() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    private func viewsShadowsPrefering() {
        animalsTextView.textViewShadow()
        virusesTextView.textViewShadow()
        microbesTextView.textViewShadow()
        manTextView.textViewShadow()
        mushroomsTextView.textViewShadow()
        archaeaTextView.textViewShadow()
    }
    
    private func textPrefering() {
        let sizeFont: Float  = 16.5
        let nameFont: String = "AvenirNext-DemiBold"
        
        plantsTextView.font     = UIFont(name: nameFont, size: CGFloat(sizeFont))
        animalsTextView.font    = UIFont(name: nameFont, size: CGFloat(sizeFont))
        microbesTextView.font   = UIFont(name: nameFont, size: CGFloat(sizeFont))
        manTextView.font        = UIFont(name: nameFont, size: CGFloat(sizeFont))
        virusesTextView.font    = UIFont(name: nameFont, size: CGFloat(sizeFont))
        archaeaTextView.font    = UIFont(name: nameFont, size: CGFloat(sizeFont))
        mushroomsTextView.font  = UIFont(name: nameFont, size: CGFloat(sizeFont))
    }
    
    private func refreshControlPrefering() {
        scrollView.refreshControl = settingsRefreshControl
    }
    
    private func searchBarButtonPrefering() {
        if let buttonItem = searchController.searchBar.subviews.first?.subviews.last as? UIButton {
               buttonItem.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 14)
        }
    }
}

extension TestsMenuViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {}
}


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
    }
}

extension UIView {
    func preferingViews() {
        cornerRadius = 12.87
        
        self.viewShadows()
        
        self.alpha = 0
        self.layer.cornerRadius = cornerRadius
    }
}
