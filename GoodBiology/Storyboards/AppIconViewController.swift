//
//  AppIconViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 3/8/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//


import UIKit

class AppIconViewController: UIViewController {

    @IBOutlet private weak var imageView:       UIImageView!
    @IBOutlet private weak var switchOutlet:    UISwitch!
    @IBOutlet private weak var switchLabel:     UILabel!
    @IBOutlet private weak var switchView:      UIView!
    @IBOutlet private weak var shareButton:     UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchViewPrefering()
        imageView.imageViewShadow()
        basicSizing()
        systemColorsPrfering()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5) {
            let alpha = 1
            
            self.imageView.alpha = CGFloat(alpha)
        }
    }
    
    @IBAction func share(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [imageView], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        
            UIApplication.shared.keyWindow?.tintColor = lazyColor
        
        self.present(activityVC, animated: true, completion: nil)
        
        shareButton.shareAudio()
    }
    
    private func systemColorsPrfering() {
        if #available(iOS 13.0, *) {
            switchLabel.labelSystemColor()
            
            switchView.viewSystemBack()
            view.viewSystemBack()
        }
    }
    
    @IBAction func switching(_ sender: UISwitch) {
        let shadowRadius: CGFloat
        
        if sender.isOn == true {
            shadowRadius = 17
            
            imageView.imageViewShadow()
            imageView.layer.shadowRadius = shadowRadius
            
            switchLabel.text = "Hide Shadow"
        } else {
            shadowRadius = 0
            
            imageView.layer.shadowRadius = shadowRadius
            
            switchLabel.text = "Show Shadow"
        }
    }
    
    @IBAction func switchViewShowing(_ sender: UIBarButtonItem) {
        if switchView.isHidden == false {
            switchView.isHidden = true
        } else {
            switchView.isHidden = false
        }
    }
    
    private func switchViewPrefering() {
        switchLabel.text = "Hide Shadow"
        switchOutlet.switchBasics()
        switchView.editorsViews()
    }
    
    private func basicSizing() {
        let alpha = CGFloat(0)
        
        imageView.alpha = alpha
    }
}
