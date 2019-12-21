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
    
    //MARK: IBOutlets
    
    //Background Views
    @IBOutlet private var plantsView:      UIView!
    @IBOutlet private var animalsView:     UIView!
    @IBOutlet private var humanView:       UIView!
    @IBOutlet private var microbesView:    UIView!
    @IBOutlet private var virusesView:     UIView!
    @IBOutlet private var fungusesView:    UIView!
    @IBOutlet private var archaeaView:     UIView!
    
    //Text View
    @IBOutlet private var plantsTextView:       UITextView!
    @IBOutlet private var animalsTextView:      UITextView!
    @IBOutlet private var manTextView:          UITextView!
    @IBOutlet private var microbesTextView:     UITextView!
    @IBOutlet private var virusesTextView:      UITextView!
    @IBOutlet private var mushroomsTextView:    UITextView!
    @IBOutlet private var archaeaTextView:      UITextView!
    
    //UILabel
    @IBOutlet weak var plantsTitle:     UILabel!
    @IBOutlet weak var animalsLabel:    UILabel!
    @IBOutlet weak var humanLabel:      UILabel!
    @IBOutlet weak var microbesLabel:   UILabel!
    @IBOutlet weak var virusLabel:      UILabel!
    @IBOutlet weak var fungusesLabel:   UILabel!
    @IBOutlet weak var archaeaLabel:    UILabel!
    
    //UIView
    @IBOutlet weak var scrollView: UIScrollView!
    
    //UIBarButtonItem
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    private let settingsRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(UIRefreshControl.endRefreshing), for: .valueChanged)
        
        return refreshControl
    }()
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MenuViewControllerDelegate
        basicViewProccesPrefering()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let views = [plantsView, animalsView, humanView, microbesView, virusesView, archaeaView, fungusesView]
        
        for (index, view) in views.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                UIApplication.shared.beginIgnoringInteractionEvents()
                view?.alpha = 1
            }) { (_) in
                UIApplication.shared.endIgnoringInteractionEvents()
            }
        }
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
        searchController.searchBar.barStyle         = .black
        searchController.searchBar.searchBarStyle   = .minimal
        searchController.view.tintColor             = lazyColor
        
        searchController.searchControllerBasics()
        
        let searchTextAppearance = UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        searchTextAppearance.font = UIFont(name: "AvenirNext-Medium", size: 14)
        
        navigationItem.searchController = searchController
    }
    
    private func viewsShadowsPrefering() {
        plantsView.preferingViews()
        animalsView.preferingViews()
        humanView.preferingViews()
        microbesView.preferingViews()
        virusesView.preferingViews()
        archaeaView.preferingViews()
        fungusesView.preferingViews()
        
        animalsTextView.textViewShadow()
        virusesTextView.textViewShadow()
        microbesTextView.textViewShadow()
        manTextView.textViewShadow()
        mushroomsTextView.textViewShadow()
        archaeaTextView.textViewShadow()
        
        plantsTitle.labelShadow()
        animalsLabel.labelShadow()
        virusLabel.labelShadow()
        microbesLabel.labelShadow()
        humanLabel.labelShadow()
        fungusesLabel.labelShadow()
        archaeaLabel.labelShadow()
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
}

extension TestsMenuViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {}
}

extension UIView {
    func preferingViews() {
        
        self.viewShadows()
        
        self.alpha = 0
        self.layer.cornerRadius = 12.87
    }
}

extension TestsMenuViewController: MenuViewControllerDelegate {
    func basicViewProccesPrefering() {
        view.viewGradient()
        
        textPrefering()
        preferingSearchContrller()
        viewsShadowsPrefering()
        systemColorsPrefeing()
        refreshControlPrefering()
    }
}
