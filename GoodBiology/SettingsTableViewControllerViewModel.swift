//
//  SettingsTableViewControllerViewModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 27.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

protocol SettingsTableViewControllerViewModelProtocol {
    func prepareinputAccessoryViewForTextView(textField: UITextField, toolBar: BasicToolbar)
    func searchBarButtonPrefering(buttonItem: UIButton)
    func refreshControlPrefering(refreshControl: UIRefreshControl, tableView: UITableView)
    func preferingSearchController(searchController: UISearchController, navItem: UINavigationItem)
    func navControllerSetup(navController: UINavigationController, _ searchBar: UISearchBar)
    func questionSet(vc: UIViewController, questionAction: ())
    func share(item: String, vc: UIViewController)
    func hideUserInfoView(view: UsersInfoView, hidden: Bool)
    func doneButtonAction(view: UIView)
    func edit(userInfoView: UsersInfoView, hideView: UIView, mainView: UIView)
    func userDefaultsSet(text: String?, key: String)
    func userIconChange(_ vc: UIViewController, imagePicker: UIImagePickerController)
}

class SettingsTableViewControllerViewModel: SettingsTableViewControllerViewModelProtocol {
    
    // prepare inputAccessoryView For TextView
    func prepareinputAccessoryViewForTextView(textField: UITextField, toolBar: BasicToolbar) {
        textField.inputAccessoryView = toolBar
    }
    
    // search BarButton Prefering
    func searchBarButtonPrefering(buttonItem: UIButton) {
        buttonItem.titleLabel?.font = UIFont(name: BasicFonts.mediumFont, size: 14)
    }
    
    // refreshControl Prefering
    func refreshControlPrefering(refreshControl: UIRefreshControl, tableView: UITableView) {
        tableView.refreshControl = refreshControl
    }
    
    // prefering SearchController
    func preferingSearchController(searchController: UISearchController, navItem: UINavigationItem) {
        navItem.searchController = searchController
    }
    
    // prefering navController
    func navControllerSetup(navController: UINavigationController, _ searchBar: UISearchBar) {
        let color: UIColor = .groupTableViewBackground
        navController.navigationBar.backgroundColor = color
        navController.navigationBar.barTintColor    = color
        
        navController.navigationBar.tintColor = .biologyGreenColor
        
        let title = "User"
        navController.navigationItem.title = title
        
        let barCanBeHidden = false
        navController.hidesBarsOnTap   = barCanBeHidden
        navController.hidesBarsOnSwipe = barCanBeHidden
        
        setupSearchBar(searchBar)
    }
    
    func setupSearchBar(_ searchBar: UISearchBar) {
        let searchField = searchBar.value(forKey: "searchField") as? UITextField

        if let field = searchField {
            field.layer.cornerRadius = 16
            field.textColor = .black
            field.tintColor = .biologyGreenColor

            field.layer.masksToBounds = true
            field.returnKeyType = .search
        }
    }
    
    // question Function setup
    func questionSet(vc: UIViewController, questionAction: ()) {
        let alertController = UIAlertController(title: """
        Please take a look at the iBiology FAQ: it has important troubelshooting tips and answers to most questions
        """, message: nil, preferredStyle: .alert)
        
        let faqAction = UIAlertAction(title: "FAQ", style: .default) { (_) in
            vc.showSafariVC(for: "https://zhbr282.wixsite.com/goodbiology-policy")
        }
        let questionAction = UIAlertAction(title: "Question", style: .cancel) { (_) in
            questionAction
        }
        alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
        alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
        
        alertController.view.tintColor = .biologyGreenColor
        
        alertController.addAction(faqAction)
        alertController.addAction(questionAction)

        vc.present(alertController, animated: true)
    }
    
    // Share function setup
    func share(item: String, vc: UIViewController) {
        let activityVC = UIActivityViewController(activityItems:
            [item], applicationActivities: nil)
        
        UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        vc.present(activityVC, animated: true, completion: nil)
    }
    
    // Hide View with user info
    func hideUserInfoView(view: UsersInfoView, hidden: Bool) {
        view.isHidden = hidden
    }
    
    // DoneButton end editing (for toolBar)
    func doneButtonAction(view: UIView) {
        view.endEditing(true)
    }
    
    // Edit Function
    func edit(userInfoView: UsersInfoView, hideView: UIView, mainView: UIView) {
        mainView.layoutIfNeeded()
        UIView.animate(withDuration: 0.2) {
            if userInfoView.isHidden != false {
                userInfoView.isHidden = false
                hideView.isHidden = true
                mainView.layoutIfNeeded()
                
            } else if hideView.isHidden == false {
                hideView.isHidden = true
                mainView.layoutIfNeeded()
                
            } else {
                hideView.isHidden = false
                mainView.layoutIfNeeded()
            }
        }
        UIView.animate(
            withDuration: 0.33,
            delay: 0,
            options: .curveEaseIn,
            animations: {
            mainView.layoutIfNeeded()
        },
            completion: nil)
    }
    
    // Set textContent Data
    func userDefaultsSet(text: String?, key: String) {
        if let text = text {
            UserDefaults.standard.set(text, forKey: key)
        } else { return }
    }
    
    func userIconChange(_ vc: UIViewController, imagePicker: UIImagePickerController) {
        let actionSheet = UIAlertController(title: nil, message: "How do you want to put the icon ?", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action: UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePicker.sourceType = .camera
                vc.present(imagePicker, animated: true, completion: nil)
            } else {
                FastAlert.showBasic(title: "Error", message: "Camera is unavailable", vc: vc)
            }
        }
        let libraryAction = UIAlertAction(title: "Library", style: .default) { (action: UIAlertAction) in
            imagePicker.sourceType = .photoLibrary
            vc.present(imagePicker, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(libraryAction)
        actionSheet.addAction(cancelAction)
        
        vc.present(actionSheet, animated: true)
    }
    
    func animation(view: UsersInfoView, image: UsersIconImageView) {
        UIView.animate(withDuration: 0.6) {
            let alpha: CGFloat = 1
            
            view.alpha = alpha
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                UIView.animate(withDuration: 0.3) {
                    image.transform = CGAffineTransform(scaleX: alpha, y: alpha)
                }
            }
        }
    }
    
    func presentMessageComposer(composer: MFMailComposeViewController) {
        composer.setToRecipients(["zhbr282@gmail.com"])
        composer.setSubject("Tests Review")
        composer.setMessageBody("Here is my problem or review on this app article or articles", isHTML: false)
        composer.view.tintColor = .biologyGreenColor
    }
}
