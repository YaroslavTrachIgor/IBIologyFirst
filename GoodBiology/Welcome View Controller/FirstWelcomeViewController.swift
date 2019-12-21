//
//  FirstWelcomeViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/13/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import AudioToolbox

class FirstWelcomeViewController: UIViewController, UIViewControllerPreviewingDelegate {
    
    //MARK: Public
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let previewView = storyboard?.instantiateViewController(withIdentifier:"content3DTouch")
        return previewView
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        let finalView = storyboard?.instantiateViewController(withIdentifier:"contentViewController")
        show(finalView!, sender: self)
    }

    //MARK: IBOutlets
    @IBOutlet fileprivate var informationView:      UIView!
    @IBOutlet fileprivate var goToAppButton:        UIButton!
    @IBOutlet fileprivate var imageView:            UIImageView!
    @IBOutlet fileprivate var welcomeLabel:         UILabel!
    @IBOutlet fileprivate var biologyLabel:         UILabel!
    @IBOutlet fileprivate var textView:             UITextView!
    @IBOutlet fileprivate var activityIndicator:    UIActivityIndicatorView!
    @IBOutlet fileprivate var shareButton:          UIButton!
    
    //MARK: Actions
    @IBAction func goToAppButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "TabBarVCSegue", sender: self)
        
        sender.flash()
    }
    
    @IBAction func sharing(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [whatsNewContent], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            activityVC.view.tintColor = #colorLiteral(red: 0, green: 0.5469487309, blue: 0.186694026, alpha: 1)
            UIApplication.shared.keyWindow?.tintColor = #colorLiteral(red: 0.004247154575, green: 0.453612864, blue: 0.1538792849, alpha: 1)
        
        self.present(activityVC, animated: true, completion: nil)
        
        shareButton.shareAudio()
    }
    
    //MARK: LifeCycle
    override func viewDidAppear(_ animated: Bool) {
        let views = [informationView, goToAppButton]
        
        for (index, objects) in views.enumerated() {
            let delay: Double = Double((index)) * 0.3
            
            UIView.animate(withDuration: 0.23 , delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                UIApplication.shared.beginIgnoringInteractionEvents()
                objects?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }) { (_) in
                UIApplication.shared.endIgnoringInteractionEvents()
            }
        }
    }
    
    func preferingBasicView() {
        self.informationView.viewShadows()
        self.textView.alpha = 0
        self.activityIndicator.activityIndicatorStarts(colorOfActivity: #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 1))
    }
    
    private func goButtonPrefering() {
        self.goToAppButton.fastButtonCostomizing(background: #colorLiteral(red: 0.004247154575, green: 0.453612864, blue: 0.1538792849, alpha: 1), titleColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), title: "Continue", corner: 12, borderWidth: 3.869)
    }
    
    private func sizingPrefering() {
        self.goToAppButton.transform    = CGAffineTransform(scaleX: 0, y: 0)
        self.informationView.transform  = CGAffineTransform(scaleX: 0, y: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferingBasicView()
        goButtonPrefering()
        sizingPrefering()
        
        UIView.animate(withDuration: 0, delay: 0.5, options: .curveLinear, animations: {
            self.textView.alpha = 1
        }) {(finished) in
            self.activityIndicator.stopAnimating()
            
            UIApplication.shared.endIgnoringInteractionEvents()
        }
        
        if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
            registerForPreviewing(with: self, sourceView: view)
        } else {
            print ("ISN'T COMPATIBLE")
        }
    }
}
