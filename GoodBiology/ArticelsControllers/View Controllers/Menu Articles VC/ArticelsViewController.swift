//
//  ArticelsViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/13/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import UserNotifications
import RealmSwift

struct ArticelsViewControllerKeys {
    static let plantsVCKey      = "plantsVCKey"
    static let animalsVCKey     = "animalsVCKey"
    static let archaeaVCKey     = "archaeaVCKey"
    static let fungusesVCKey    = "fungusesVCKey"
    static let virusesVCKey     = "virusesVCKey"
    static let humanVCKey       = "humanVCKey"
    static let microbesVCKey    = "microbesVCKey"
}

class ArticelsViewController: UIViewController, BasicViewControllerStatusBarBackColorSetupProtocol {
    
    //MARK: NotificationNames
    struct NotificationNames {
        static let plantsVCKeyName      = Notification.Name(rawValue: ArticelsViewControllerKeys.plantsVCKey)
        static let animalsVCKeyName     = Notification.Name(rawValue: ArticelsViewControllerKeys.animalsVCKey)
        static let archaeaVCKeyName     = Notification.Name(rawValue: ArticelsViewControllerKeys.archaeaVCKey)
        static let fungusesVCKeyName    = Notification.Name(rawValue: ArticelsViewControllerKeys.fungusesVCKey)
        static let virusesVCKeyName     = Notification.Name(rawValue: ArticelsViewControllerKeys.virusesVCKey)
        static let humenVCKeyName       = Notification.Name(rawValue: ArticelsViewControllerKeys.humanVCKey)
        static let microbesVCKeyName    = Notification.Name(rawValue: ArticelsViewControllerKeys.microbesVCKey)
    }
    
    // ViewModel
    let viewModel = ArticelsViewControllerViewModel()
    
    //MARK: IBOutlets
    let gradient: BasicRootVCGradient = BasicRootVCGradient(color: #colorLiteral(red: 0.9783470812, green: 0.9783470812, blue: 0.9783470812, alpha: 1))
    
    @IBOutlet weak var popularButton: PopularButton!
    
    // View Previews
    @IBOutlet var designView: [MenuCellRightView]!
    
    @IBOutlet weak var newArticleLabel: NewArticleLabel!
    
    @IBOutlet weak var plantsView:    ArticlePreviewView!
    @IBOutlet weak var mainView:      ArticlePreviewView!
    @IBOutlet weak var microbesView:  ArticlePreviewView!
    @IBOutlet weak var animalsView:   ArticlePreviewView!
    @IBOutlet weak var archaeaView:   ArticlePreviewView!
    @IBOutlet weak var manView:       ArticlePreviewView!
    @IBOutlet weak var virusesView:   ArticlePreviewView!
    @IBOutlet weak var mushroomsView: ArticlePreviewView! {
        /// There is a small error here with this view, so I had to set back here
        didSet { mushroomsView.backgroundColor = #colorLiteral(red: 0.9796359454, green: 0.9796359454, blue: 0.9796359454, alpha: 1) }
    }
    @IBOutlet weak var chromistaView: ArticlePreviewView!
    
    // UITextView
    @IBOutlet weak var plantTextView:     UITextView!
    @IBOutlet weak var animalTextView:    UITextView!
    @IBOutlet weak var microbeTextView:   UITextView!
    @IBOutlet weak var humanTextView:     UITextView!
    @IBOutlet weak var virusTextView:     UITextView!
    @IBOutlet weak var archaeaTextView:   UITextView!
    @IBOutlet weak var fungusTextView:    UITextView!
    @IBOutlet weak var chromistaTextView: UITextView!
    
    // Labels
    @IBOutlet weak var newLabel: NewLabel!
    
    @IBOutlet weak var plantsLabel:    ArticlesMenuLabel!
    @IBOutlet weak var animalsLabel:   ArticlesMenuLabel!
    @IBOutlet weak var microbesLabel:  ArticlesMenuLabel!
    @IBOutlet weak var humanLabel:     ArticlesMenuLabel!
    @IBOutlet weak var virusesLabel:   ArticlesMenuLabel!
    @IBOutlet weak var archaeaLabel:   ArticlesMenuLabel!
    @IBOutlet weak var fungusesLabel:  ArticlesMenuLabel!
    @IBOutlet weak var chromistaLabel: ArticlesMenuLabel!
    
    // UIScrollView
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var videoPlayerVCShowerButtonBackView:   ChromistaActionButtonsBack!
    @IBOutlet weak var readingOnTimeVCShowerButtonBackView: ChromistaActionButtonsBack!
    @IBOutlet weak var supportVCShowerButtonBackView:       ChromistaActionButtonsBack!
    
    //MARK: - Lazy Properties
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
        
        /// setup NavController
        setupNavController()
        setupNavBarTitle()
        setupStatusBar(for: self, backColor: .white)
    }
    
    
    //MARK: - Overrides
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.setupNavigationController(navigationController!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let views = [plantsView, animalsView, microbesView, manView, virusesView, archaeaView, mushroomsView, chromistaView]
        let buttons = [readingOnTimeVCShowerButtonBackView, videoPlayerVCShowerButtonBackView, supportVCShowerButtonBackView, popularButton]
        let labels: [ArticlesMenuLabel] = [plantsLabel, animalsLabel, microbesLabel, virusesLabel, chromistaLabel, humanLabel, fungusesLabel, archaeaLabel]
        
        viewModel.previewAnimation(views: views as! [UIView], buttons: buttons as! [UIView])
        viewModel.previewLabelsAnimation(labels: labels, navBar: navigationController!.navigationBar)
        viewModel.setupWhatsNewVC(for: self)
    }
    
    override func viewWillLayoutSubviews() {
        gradient.setupRootViewsWithBasicGradient(mainView: view, scrollView: scrollView)
    }
    
    func notificationAlert() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
    }
}



// MARK: - Setup NavItem and NavController
extension ArticelsViewController {
    private func setupNavBarTitle() {
        NotificationCenter.default.addObserver(self, selector: #selector(setupNavItemTextColorWhenPresentFRaomCollectionView(notification:)), name: MenuCollectionViewConterollerVCsPresentKeys.mainArticlesMenuVCpopKey, object: nil)
    }
    
    @objc func setupNavItemTextColorWhenPresentFRaomCollectionView(notification: NSNotification) {
        let labels: [ArticlesMenuLabel] = [plantsLabel, animalsLabel, microbesLabel, virusesLabel, chromistaLabel, humanLabel, fungusesLabel, archaeaLabel]
        
        for label in labels {
            label.textColor = .biologyGreenColor
            navigationController!.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.biologyGreenColor]
        }
    }
}



//MARK: - ArticelsViewControllerProtocol
extension ArticelsViewController: ArticelsViewControllerProtocol {
    func setupNavController() {
        viewModel.setupNavigationControllerBackColor(navigationController!)
        viewModel.setupSearchBar(searchController.searchBar)
    }
}



//MARK: - Setup Content
extension ArticelsViewController {
    private func contentJsonSetup() {
        //MARK: Data Give
        viewModel.setJsonData(label: plantsLabel,
                    textView: plantTextView,
                    contentJsonID: "PlantsContent",
                    titleJsonID: "PlantsTitle",
                    articlePreviewJsonID: "PlantsArticlePreview", vc: self)
        viewModel.setJsonData(label: animalsLabel,
                    textView: animalTextView,
                    contentJsonID: "AnimalsContent",
                    titleJsonID: "AnimalsTitle",
                    articlePreviewJsonID: "AnimalsArticlePreview", vc: self)
        viewModel.setJsonData(label: humanLabel,
                    textView: humanTextView,
                    contentJsonID: "HumanContent",
                    titleJsonID: "HumanTitle",
                    articlePreviewJsonID: "HumanArticlePreview", vc: self)
        viewModel.setJsonData(label: microbesLabel,
                    textView: microbeTextView,
                    contentJsonID: "MicrobesContent",
                    titleJsonID: "MicrobesTitle",
                    articlePreviewJsonID: "MicrobesArticlePreview", vc: self)
        viewModel.setJsonData(label: virusesLabel,
                    textView: virusTextView,
                    contentJsonID: "VirusesContent",
                    titleJsonID: "VirusesTitle",
                    articlePreviewJsonID: "VirusesArticlePreview", vc: self)
        viewModel.setJsonData(label: archaeaLabel,
                    textView: archaeaTextView,
                    contentJsonID: "ArchaeaContent",
                    titleJsonID: "ArchaeaTitle",
                    articlePreviewJsonID: "ArchaeaArticlePreview", vc: self)
        viewModel.setJsonData(label: chromistaLabel,
                    textView: chromistaTextView,
                    contentJsonID: "ChromistaContent",
                    titleJsonID: "ChromistaTitle",
                    articlePreviewJsonID: "ChromistaArticlePreview", vc: self)
        viewModel.setJsonData(label: fungusesLabel,
                    textView: fungusTextView,
                    contentJsonID: "FungusesContent",
                    titleJsonID: "FungusesTitle",
                    articlePreviewJsonID: "FungusesArticlePreview", vc: self)

    }
}
