//
//  ThemesMenuTableViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 30.10.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import AudioToolbox

class ThemesMenuTableViewController: UITableViewController {

    //MARK: IBOutlets
    @IBOutlet weak var table:       UITableView!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    let settingsRefreshControl: UIRefreshControl = {
        let refreshControl = BasicRefreshControl()
        
        return refreshControl
    }()
    
    private let searchController = BasicSearchController()
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return    text.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControlPrefering()
    }
        
    private func refreshControlPrefering() {
        table.refreshControl = settingsRefreshControl
    }
    
    @IBAction func share(_ sender: UIBarButtonItem) {
        let shareInformation = navigationItem.title!
        let activityVC = UIActivityViewController(activityItems: [shareInformation], applicationActivities: nil)
        
        UIApplication.shared.keyWindow?.tintColor = lazyColor
        AudioServicesPlayAlertSound(SystemSoundID(1001))
        
        present(activityVC, animated: true)
    }
}
