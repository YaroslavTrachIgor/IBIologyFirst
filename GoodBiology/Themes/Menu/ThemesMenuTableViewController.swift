//
//  ThemesMenuTableViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 30.10.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import AudioToolbox

final class ThemesTableView: UITableView {
    
    @IBOutlet weak var imageHeightConstrint: NSLayoutConstraint?
    @IBOutlet weak var imageBottomConstraint: NSLayoutConstraint?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let header = tableHeaderView else { return }
        setImageConstraints(header)
        setConstants(header)
        setupHeader(header)
    }
}

extension ThemesTableView {
    func setImageConstraints(_ header: UIView) {
        if let imageView = header.subviews.first as? UIImageView {
            imageHeightConstrint  = imageView.constraints.filter{ $0.identifier == "height" }.first
            imageBottomConstraint = imageView.constraints.filter{ $0.identifier == "bottom" }.first
        }
    }
    
    func setConstants(_ header: UIView) {
        let offsetY = -contentOffset.y
        imageBottomConstraint?.constant = offsetY >= 0 ? 0 : offsetY / 2
        imageHeightConstrint?.constant = max(header.bounds.height, header.bounds.height + offsetY)
    }
    
    func setupHeader(_ header: UIView) {
        header.clipsToBounds = true
    }
}

final class ThemesMenuTableViewController: UITableViewController {

    //MARK: IBOutlets
    @IBOutlet weak var table:       ThemesTableView! {
        didSet { table.refreshControl = settingsRefreshControl }
    }
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    lazy var settingsRefreshControl: UIRefreshControl = {
        let refreshControl = BasicRefreshControl()
        
        return refreshControl
    }()
    
    lazy var searchController = BasicSearchController()
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationControllerSetup()
    }
}

//MARK: - Actions
extension ThemesMenuTableViewController {
    @IBAction func share(_ sender: UIBarButtonItem) {
        let shareInformation = navigationItem.title!
        let activityVC = UIActivityViewController(activityItems: [shareInformation], applicationActivities: nil)
        
        UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        AudioServicesPlayAlertSound(SystemSoundID(1001))
        
        present(activityVC, animated: true)
    }
}

//MARK: - Main Functions
extension ThemesMenuTableViewController {
    private func navigationControllerSetup() {
        navigationController?.hidesBarsOnTap = false
    }
}
