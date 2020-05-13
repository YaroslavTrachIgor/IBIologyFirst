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
    // View Previews
    @IBOutlet var designView: [MenuCellRightView]!
    
    @IBOutlet weak var newArticleLabel: NewArticleLabel!
    
    @IBOutlet weak var plantsView:       ArticleView!
    @IBOutlet weak var mainView:         ArticleView!
    @IBOutlet weak var microbesView:     ArticleView!
    @IBOutlet weak var animalsView:      ArticleView!
    @IBOutlet weak var archaeaView:      ArticleView!
    @IBOutlet weak var manView:          ArticleView!
    @IBOutlet weak var virusesView:      ArticleView! {
        didSet {
            if #available(iOS 13.0, *) {
                virusesView.backgroundColor = .systemBackground
            }
        }
    }
    @IBOutlet weak var mushroomsView:    ArticleView!
    @IBOutlet weak var chromistaView:    ArticleView!
    
    // UITextView
    @IBOutlet weak var plantTextView:       UITextView!
    @IBOutlet weak var animalTextView:      UITextView!
    @IBOutlet weak var microbeTextView:     UITextView!
    @IBOutlet weak var humanTextView:       UITextView!
    @IBOutlet weak var virusTextView:       UITextView!
    @IBOutlet weak var archaeaTextView:     UITextView!
    @IBOutlet weak var fungusTextView:      UITextView!
    @IBOutlet weak var chromistaTextView:   UITextView!
    
    // Labels
    @IBOutlet weak var newLabel: NewLabel!
    
    @IBOutlet weak var plantsLabel:         ArticlesMenuLabel!
    @IBOutlet weak var animalsLabel:        ArticlesMenuLabel!
    @IBOutlet weak var microbesLabel:       ArticlesMenuLabel!
    @IBOutlet weak var humanLabel:          ArticlesMenuLabel!
    @IBOutlet weak var virusesLabel:        ArticlesMenuLabel!
    @IBOutlet weak var archaeaLabel:        ArticlesMenuLabel!
    @IBOutlet weak var fungusesLabel:       ArticlesMenuLabel!
    @IBOutlet weak var chromistaLabel:      ArticlesMenuLabel!
    
    // UIScrollView
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var videoPlayerVCShowerButtonBackView:   ChromistaActionButtonsBack!
    @IBOutlet weak var readingOnTimeVCShowerButtonBackView: ChromistaActionButtonsBack!
    
    // UISearchController
    lazy var searchController = BasicSearchController()
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return    text.isEmpty
    }
    
    // UIRefreshControl
    lazy var settingsRefreshControl: UIRefreshControl = {
        let refreshControl = BasicRefreshControl()
        
        return refreshControl
    }()
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Articles Preview Content Json Setup
        contentJsonSetup()
        
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
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    let buttons = [self.videoPlayerVCShowerButtonBackView, self.readingOnTimeVCShowerButtonBackView]
                    
                    for (index, buttons) in buttons.enumerated() {
                        let delay: Double = Double((index)) * 0.2
                        
                        UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
        
                            buttons?.alpha = alpha
                        })
                    }
                }
            })
        }
    }
    
    func notificationAlert() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
    }
}
