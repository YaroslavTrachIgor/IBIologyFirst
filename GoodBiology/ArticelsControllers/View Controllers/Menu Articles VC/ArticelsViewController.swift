//
//  ArticelsViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/13/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import UserNotifications

class ArticelsViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var plantsView:       UIView!
    @IBOutlet weak var mainView:         UIView!
    @IBOutlet weak var microbesView:     UIView!
    @IBOutlet weak var animalsView:      UIView!
    @IBOutlet weak var archaeaView:      UIView!
    @IBOutlet weak var manView:          UIView!
    @IBOutlet weak var virusesView:      UIView!
    @IBOutlet weak var mushroomsView:    UIView!
    @IBOutlet weak var chromistaView:    UIView!
    
    @IBOutlet weak var plantTextView:       UITextView!
    @IBOutlet weak var animalTextView:      UITextView!
    @IBOutlet weak var microbeTextView:     UITextView!
    @IBOutlet weak var humanTextView:       UITextView!
    @IBOutlet weak var virusTextView:       UITextView!
    @IBOutlet weak var archaeaTextView:     UITextView!
    @IBOutlet weak var fungusTextView:      UITextView!
    @IBOutlet weak var chromistaTextView:   UITextView!
    
    @IBOutlet weak var newLabel: UILabel!
    
    @IBOutlet weak var plantsLabel:         UILabel!
    @IBOutlet weak var animalsLabel:        UILabel!
    @IBOutlet weak var microbesLabel:       UILabel!
    @IBOutlet weak var humanLabel:          UILabel!
    @IBOutlet weak var virusesLabel:        UILabel!
    @IBOutlet weak var archaeaLabel:        UILabel!
    @IBOutlet weak var fungusesLabel:       UILabel!
    @IBOutlet weak var chromistaLabel:      UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return    text.isEmpty
    }
    
    let settingsRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(UIRefreshControl.endRefreshing), for: .valueChanged)
        
        return refreshControl
    }()
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MenuViewControllerDelegate
        basicViewProccesPrefering()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let views = [plantsView, animalsView, microbesView, manView, virusesView, archaeaView, mushroomsView, chromistaView]
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
    
    private func setupNewLabel() {
        newLabel.labelShadow()
        newLabel.layer.shadowColor  = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        newLabel.layer.shadowRadius = 2
    }
    
    private func labelsSetup() {
        let color = #colorLiteral(red: 0.01995553821, green: 0.3423653841, blue: 0.1189347133, alpha: 1)
        
        plantsLabel.textColor    = color
        animalsLabel.textColor   = color
        microbesLabel.textColor  = color
        humanLabel.textColor     = color
        virusesLabel.textColor   = color
        archaeaLabel.textColor   = color
        fungusesLabel.textColor  = color
        chromistaLabel.textColor = color
        
        plantsLabel.labelShadow()
        animalsLabel.labelShadow()
        microbesLabel.labelShadow()
        humanLabel.labelShadow()
        virusesLabel.labelShadow()
        archaeaLabel.labelShadow()
        fungusesLabel.labelShadow()
        chromistaLabel.labelShadow()
    }
    
    private func systemColors() {
        if #available(iOS 13.0, *) {
            view.viewSystemBack()
            scrollView.viewSystemBack()
            
            plantsView.backgroundColor          = .systemBackground
            animalsView.backgroundColor         = .systemBackground
            microbesView.backgroundColor        = .systemBackground
            manView.backgroundColor             = .systemBackground
            virusesView.backgroundColor         = .systemBackground
            archaeaView.backgroundColor         = .systemBackground
            mushroomsView.backgroundColor       = .systemBackground
            chromistaTextView.backgroundColor   = .systemBackground
            
            plantTextView.textColor     = .secondaryLabel
            animalTextView.textColor    = .secondaryLabel
            microbeTextView.textColor   = .secondaryLabel
            humanTextView.textColor     = .secondaryLabel
            virusTextView.textColor     = .secondaryLabel
            archaeaTextView.textColor   = .secondaryLabel
            fungusTextView.textColor    = .secondaryLabel
            chromistaTextView.textColor = .secondaryLabel
        } else {
            // Fallback on earlier versions
        }
    }
    
    private func textViewShadowPrefering() {
        plantTextView.textViewShadow()
        animalTextView.textViewShadow()
        microbeTextView.textViewShadow()
        humanTextView.textViewShadow()
        virusTextView.textViewShadow()
        archaeaTextView.textViewShadow()
        fungusTextView.textViewShadow()
        chromistaTextView.textViewShadow()
    }
    
    private func textViewsFontPrefering() {
        let size = 16.5
        let font = mediumFont
        
        plantTextView.font   = UIFont(name: font, size: CGFloat(size))
        animalTextView.font  = UIFont(name: font, size: CGFloat(size))
        microbeTextView.font = UIFont(name: font, size: CGFloat(size))
        humanTextView.font   = UIFont(name: font, size: CGFloat(size))
        virusTextView.font   = UIFont(name: font, size: CGFloat(size))
        archaeaTextView.font = UIFont(name: font, size: CGFloat(size))
        fungusTextView.font  = UIFont(name: font, size: CGFloat(size))
        chromistaTextView.font   = UIFont(name: font, size: CGFloat(size))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func preferingSearchController() {
        searchController.searchResultsUpdater           = self
        searchController.searchBar.barStyle             = .default
        searchController.searchBar.searchBarStyle       = .minimal
        searchController.view.tintColor                 = lazyColor
        searchController.searchBar.clipsToBounds        = true
        
        let searchTextAppearance = UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        searchTextAppearance.font = UIFont(name: "AvenirNext-Medium", size: 14)
        
        navigationItem.searchController = searchController
        searchController.searchControllerBasics()
    }
    
    private func viewsPrefering() {
        view.setGradientBackground(colorOne: #colorLiteral(red: 0.8867615461, green: 0.8814904094, blue: 0.8908136487, alpha: 1), colorTwo: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        
        plantsView.preferingViews()
        microbesView.preferingViews()
        animalsView.preferingViews()
        manView.preferingViews()
        archaeaView.preferingViews()
        virusesView.preferingViews()
        mushroomsView.preferingViews()
        chromistaView.preferingViews()
        
        archaeaView.layer.shadowColor   = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        mushroomsView.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    private func notificationAlert() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
    }
    
    private func refreshControlPrefering() {
        scrollView.refreshControl = settingsRefreshControl
    }
}

extension ArticelsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {}
}

extension ArticelsViewController: MenuViewControllerDelegate {
    func basicViewProccesPrefering() {
        preferingSearchController()
        viewsPrefering()
        notificationAlert()
        textViewsFontPrefering()
        systemColors()
        textViewShadowPrefering()
        refreshControlPrefering()
        labelsSetup()
        setupNewLabel()
    }
}
