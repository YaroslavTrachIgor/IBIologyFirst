//
//  ArticleViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 2/5/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    @IBOutlet fileprivate var label: UILabel!
    @IBOutlet fileprivate var segmentedControl: UISegmentedControl!
    @IBOutlet weak var contentTextView: UITextView!
    
    @IBAction func choosingText(_ sender: UISegmentedControl) {
        switch  segmentedControl.selectedSegmentIndex {
        case 0:
            contentTextView.text = plantsMostContent
        case 1:
            contentTextView.text = plantsBasicsContent
        default:
            print(" Error ")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
