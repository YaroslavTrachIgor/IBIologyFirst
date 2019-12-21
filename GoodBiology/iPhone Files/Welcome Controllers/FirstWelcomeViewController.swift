//
//  FirstWelcomeViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/13/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

class FirstWelcomeViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var goodBiologyLabel: UILabel!
    @IBOutlet weak var welcomeToLabel: UILabel!
    
    var presentWelcomeText = ""
    var presentBiologyText = ""
    var curentPafe = 0
    var numberOfPages = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        goodBiologyLabel.text = presentBiologyText
        welcomeToLabel.text = presentBiologyText
        pageControl.currentPage = curentPafe
        pageControl.numberOfPages = numberOfPages
    }

}
