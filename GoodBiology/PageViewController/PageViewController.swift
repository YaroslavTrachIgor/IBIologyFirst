//
//  PageViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/23/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    var textArray = ["In Good Biology you will find a lot of information about biology, as well as its main representatives. You can read almost everything: starting from the basics ending with the history. And also we made complete convenience for reading - reading at time mode, choosing text font size and putting reminders on articles.", "Create lists of what you want to read today. You will be able to put a date on the note, as well as find the best places to read.", "For Good Biology, we have compiled interesting tests to test your knowledge and how carefully you read the articles. The tests are not very easy, and in some places even very difficult."]
    var header = ["Articels", "Notes", "Tests"]
    var imagesArray = ["literature", "graduation_cap", "today_apps"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func displayViewController(atIndex index: Int) -> FirstWelcomeViewController {
        guard index >= 0 else { return nil }
        guard index < header.count else { return nil }
    }
}
