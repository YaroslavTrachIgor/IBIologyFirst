//
//  PageViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/13/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    let presentScreenContent = ["Welcome To",
                                "Good Biology",
                                "Our App"]
    
    func showViewControllerAtIndex(_ index: Int) -> FirstWelcomeViewController? {
        
        guard index >= 0 else { return nil }
        guard index < presentScreenContent.count else { return nil }
        guard let firstView = storyboard?.instantiateInitialViewController(withIdentifier: "FirstWelcomeViewController") as ? FirstWelcomeViewController else { return nil }
        
        return FirstWelcomeViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
