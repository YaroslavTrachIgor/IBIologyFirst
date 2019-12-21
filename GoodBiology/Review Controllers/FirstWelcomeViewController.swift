//
//  FirstWelcomeViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 3/15/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

class FirstWelcomeViewController: UIViewController {

    @IBOutlet fileprivate var pageControll:     UIPageControl!
    @IBOutlet fileprivate var continueButton:   UIButton!
    @IBOutlet fileprivate var scrollView:       UIScrollView!
    @IBOutlet fileprivate var welcomeLabel:     UILabel!
    @IBOutlet fileprivate var biologyLabel:     UILabel!
    @IBOutlet fileprivate var contentTextView:  UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        continueButtonPrefering()
        basicViewPrefering()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let views = [welcomeLabel, biologyLabel, contentTextView, pageControll]
        
        for (index, view) in views.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.23, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                UIApplication.shared.beginIgnoringInteractionEvents()
                view?.alpha = 1
            }) { (_) in
                UIApplication.shared.endIgnoringInteractionEvents()
                
                let alert           = UIAlertController(title: "Welcome !", message: nil, preferredStyle: .alert)
                let continueAction  = UIAlertAction(title: "Continue", style: .cancel, handler: nil)
                             alert.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
                             alert.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
                             alert.addAction(continueAction)
                             alert.view.tintColor = lazyColor
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func goToApp(_ sender: Any) {
        performSegue(withIdentifier: "TabBarVCSegue", sender: self)
    }
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        scrollView.setContentOffset(CGPoint(x: scrollView.frame.width * CGFloat(sender.currentPage), y: 0), animated: true)
    }
    
    private func continueButtonPrefering() {
        cornerRadius = 14
        
        continueButton.fastButtonCostomizing(background: #colorLiteral(red: 0.004247154575, green: 0.453612864, blue: 0.1538792849, alpha: 1), titleColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), title: "Continue", corner: Float(CGFloat(cornerRadius)), borderWidth: 3.6)
    }
    
    private func basicViewPrefering() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        welcomeLabel.labelShadow()
        biologyLabel.labelShadow()
    }
    
    private func firstUISizing() {
        let alpha = 0
        
        welcomeLabel.alpha      = CGFloat(alpha)
        biologyLabel.alpha      = CGFloat(alpha)
        contentTextView.alpha   = CGFloat(alpha)
        pageControll.alpha      = CGFloat(alpha)
    }
}

extension FirstWelcomeViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControll.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
    }
}
