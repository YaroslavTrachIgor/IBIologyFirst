//
//  ArticelsViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/13/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import UserNotifications

protocol ArticelsViewControllerProtocol {
    func articelsViewControllerTextViewSetup()
}

class ArticelsViewController: UIViewController, ArticelsViewControllerProtocol {
    
    //MARK: IBOutlets
    @IBOutlet weak var plantsView:       ArticleView!
    @IBOutlet weak var mainView:         ArticleView!
    @IBOutlet weak var microbesView:     ArticleView!
    @IBOutlet weak var animalsView:      ArticleView!
    @IBOutlet weak var archaeaView:      ArticleView!
    @IBOutlet weak var manView:          ArticleView!
    @IBOutlet weak var virusesView:      ArticleView!
    @IBOutlet weak var mushroomsView:    ArticleView!
    @IBOutlet weak var chromistaView:    ArticleView!
    
    @IBOutlet weak var plantTextView:       UITextView!
    @IBOutlet weak var animalTextView:      UITextView!
    @IBOutlet weak var microbeTextView:     UITextView!
    @IBOutlet weak var humanTextView:       UITextView!
    @IBOutlet weak var virusTextView:       UITextView!
    @IBOutlet weak var archaeaTextView:     UITextView!
    @IBOutlet weak var fungusTextView:      UITextView!
    @IBOutlet weak var chromistaTextView:   UITextView!
    
    @IBOutlet weak var newLabel: NewLabel!
    
    @IBOutlet weak var plantsLabel:         ArticlesMenuLabel!
    @IBOutlet weak var animalsLabel:        ArticlesMenuLabel!
    @IBOutlet weak var microbesLabel:       ArticlesMenuLabel!
    @IBOutlet weak var humanLabel:          ArticlesMenuLabel!
    @IBOutlet weak var virusesLabel:        ArticlesMenuLabel!
    @IBOutlet weak var archaeaLabel:        ArticlesMenuLabel!
    @IBOutlet weak var fungusesLabel:       ArticlesMenuLabel!
    @IBOutlet weak var chromistaLabel:      ArticlesMenuLabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    private let searchController = BasicSearchController()
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return    text.isEmpty
    }
    
    let settingsRefreshControl: UIRefreshControl = {
        let refreshControl = BasicRefreshControl()
        
        return refreshControl
    }()
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// MenuViewControllerDelegate
        basicViewProccesPrefering()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let views = [plantsView, animalsView, microbesView, manView, virusesView, archaeaView, mushroomsView, chromistaView]
        for (index, views) in views.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                let alpha: CGFloat = 1
                
                views?.alpha = alpha
            })
        }
    }
    
    func articelsViewControllerTextViewSetup() {
        textViewsFontPrefering()
        textViewShadowPrefering()
    }
    
    private func systemColors() {
        if #available(iOS 13.0, *) {
            plantTextView.setSecondaryTextColor()
            animalTextView.setSecondaryTextColor()
            microbeTextView.setSecondaryTextColor()
            humanTextView.setSecondaryTextColor()
            virusTextView.setSecondaryTextColor()
            archaeaTextView.setSecondaryTextColor()
            fungusTextView.setSecondaryTextColor()
            chromistaTextView.setSecondaryTextColor()
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
        plantTextView.setMenuFont()
        animalTextView.setMenuFont()
        microbeTextView.setMenuFont()
        humanTextView.setMenuFont()
        virusTextView.setMenuFont()
        archaeaTextView.setMenuFont()
        fungusTextView.setMenuFont()
        chromistaTextView.setMenuFont()
    }
    
    private func preferingSearchController() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
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
        systemColors()
        refreshControlPrefering()
        notificationAlert()
        articelsViewControllerTextViewSetup()
        setupSearchBarFont()
    }
}

extension UITextView: ArticelsViewControllerProtocol {
    func articelsViewControllerTextViewSetup() {
        setSecondaryTextColor()
        setMenuFont()
    }
    
    func setSecondaryTextColor() {
        textColor = .secondaryLabel
    }
    
    func setMenuFont() {
        let size: CGFloat       = 16.5
        let fontName: String    = mediumFont
        
        self.font = UIFont(name: fontName, size: size)
    }
}
