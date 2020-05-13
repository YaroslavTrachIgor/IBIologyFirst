//
//  SettingsTableViewControllerSaveFunctionViewModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 27.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class SettingsTableViewControllerSaveFunctionViewModel {
    func loadAnimationSetup(with navigationItem: UINavigationItem, with view: UIView) {
        navigationItem.title = "User"
        
        view.isHidden = true
        view.alpha = 0
    }
    
    func acSubViewSetup(with view: UIView, mainView: UIView) {
        view.backgroundColor = .groupTableViewBackground
        view.layer.cornerRadius = 10
        
        view.viewShadows()
        
        mainView.addSubview(view)
    }
    
    func acInViewIndicator_StartAnimation_Setup(with activityIndicaor: UIActivityIndicatorView, mainView: UIView) {
        activityIndicaor.center = mainView.center
        activityIndicaor.startAnimating()
        activityIndicaor.style = .large
        activityIndicaor.activityIndicatorViewShadow()
        
        mainView.addSubview(activityIndicaor)
    }
    
    func acInViewIndicator_EndAnimation_Setup(with activityIndicaor: UIActivityIndicatorView, mainView: UIView) {
        activityIndicaor.center = mainView.center
        activityIndicaor.startAnimating()
        activityIndicaor.style = .large
        activityIndicaor.activityIndicatorViewShadow()
        
        mainView.addSubview(activityIndicaor)
    }
    
    func buttonsEnabledSetup(buttons: UIBarButtonItem, enabled: Bool) {
        buttons.isEnabled = enabled
    }
    
    func navigationTitleSet(navItem: UINavigationItem) {
        navItem.title = ""
    }
}
