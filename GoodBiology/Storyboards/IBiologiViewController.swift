//
//  IBiologiViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 3/7/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

class IBiologiViewController: UIViewController {

    @IBOutlet fileprivate var IBiologiImageView:    UIImageView!
    @IBOutlet fileprivate var goButton:             UIButton!
    @IBOutlet fileprivate var welcomeLabel:         UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5) {
            
            self.IBiologiImageView.alpha = 1
            self.goButton.alpha          = 1
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IBiologiImageView.alpha = 0
        goButton.alpha          = 0
        
        IBiologiImageView.imageViewShadow()
        goButton.buttonsShadows()
        welcomeLabel.labelShadow()
        
        goButton.fastButtonCostomizing(background: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), titleColor: #colorLiteral(red: 0, green: 0.5469487309, blue: 0.186694026, alpha: 1), title: "Continue", corner: 0, borderWidth: 0)
    }
}
