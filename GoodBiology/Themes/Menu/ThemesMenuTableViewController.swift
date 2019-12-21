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

    @IBOutlet weak var table:       UITableView!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    let settingsRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(UIRefreshControl.endRefreshing), for: .valueChanged)
        
        return refreshControl
    }()
    
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
        
        UIApplication.shared.keyWindow?.tintColor = #colorLiteral(red: 0.004247154575, green: 0.453612864, blue: 0.1538792849, alpha: 1)
        AudioServicesPlayAlertSound(SystemSoundID(1001))
        
        present(activityVC, animated: true)
    }
}
