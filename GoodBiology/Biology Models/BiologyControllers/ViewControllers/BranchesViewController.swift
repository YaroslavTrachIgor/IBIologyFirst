//
//  BranchesViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12/27/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

class BranchesViewController: UIViewController {

    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var navTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navTitle.title = titles[myIndex]
        contentTextView.text = content[myIndex]
    }
}
