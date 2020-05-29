//
//  ThemesViewModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 22.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

//MARK: - ThemesControllerViewModelMainFunctionsProtocol protocol
protocol ThemesControllerViewModelMainFunctionsProtocol {
    func viewDidAppearAnimationSetup(back: UIView)
    func viewAlphaSetup(view: UIView, alpha: CGFloat)
    func viewCornersSetup(view: UIView, corners: CGFloat)
    func navItemSetup(buttons: [UIBarButtonItem], navItem: UINavigationItem)
    func setupContentTextViewContent(textView: UITextView, text: String)
    func contentTextViewEditableSetup(textView: UITextView, editable: Bool)
    func contentTextViewSetup(contentTextView: UITextView)
    func checkForRatesEnabled(navIten: UINavigationItem, rateFunc: () -> Void)
}



//MARK: - ThemesTableVControllersViewModelProtocol protocol
protocol ThemesTableVControllersViewModelProtocol {
    func setupShare(navigationItem: UINavigationItem, vc: UIViewController)
    func setupConstant(constant: CGFloat, for constraint: NSLayoutConstraint?)
    func setupNavController(navigationController: UINavigationController)
}


//MARK: - ThemesControllerViewModel main class
class ThemesControllersViewModel {}



//MARK: - ThemesControllerViewModel MainFunctions Protocol
extension ThemesControllersViewModel: ThemesControllerViewModelMainFunctionsProtocol {
    func viewDidAppearAnimationSetup(back: UIView) {
           UIView.animate(withDuration: 0.6) {
               back.alpha = 1
           }
       }
       
    func viewAlphaSetup(view: UIView, alpha: CGFloat) {
        view.alpha = alpha
    }
    
    func viewCornersSetup(view: UIView, corners: CGFloat) {
        view.layer.cornerRadius = corners
    }
    
    func navItemSetup(buttons: [UIBarButtonItem], navItem: UINavigationItem) {
        navItem.rightBarButtonItems = buttons
    }
    
    func setupContentTextViewContent(textView: UITextView, text: String) {
        textView.text = text
    }
    
    func contentTextViewEditableSetup(textView: UITextView, editable: Bool) {
        textView.isEditable = editable
    }
    
    func contentTextViewSetup(contentTextView: UITextView) {
        contentTextView.font      = UIFont(name: "AvenirNext-Medium", size: 17)
        contentTextView.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
    }
    
    func checkForRatesEnabled(navIten: UINavigationItem, rateFunc: () -> Void) {
        if navIten.title == "Fungi" {
            rateFunc()
        }
    }
    
    func fastActivityVC(content: String, vc: UIViewController) {
        let activityVC = UIActivityViewController(activityItems: [content], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = vc.view
        
            UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        vc.present(activityVC, animated: true, completion: nil)
    }
}



//MARK: - For @IBActions
extension ThemesControllersViewModel {
    
    //MARK: - Public
    public func stepperViewHiddenSetup(stepperView: UIView) {
        if stepperView.isHidden == true {
            stepperView.isHidden = false
        } else {
            stepperView.isHidden = true
        }
    }
    
    public func contentFontChange(contentTextView: UITextView, stepper sender: UIStepper) {
        let font     = contentTextView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        contentTextView.font = UIFont(name: font!, size: fontSize)
    }
}



//MARK: - For ThemesTableVC
extension ThemesControllersViewModel: ThemesTableVControllersViewModelProtocol {
    func setupConstant(constant: CGFloat, for constraint: NSLayoutConstraint?) {
        constraint?.constant = constant
    }
    
    func setupShare(navigationItem: UINavigationItem, vc: UIViewController) {
        let shareInformation = navigationItem.title!
        let activityVC = UIActivityViewController(activityItems: [shareInformation], applicationActivities: nil)
        
        UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        AudioServicesPlayAlertSound(SystemSoundID(1001))
        
        vc.present(activityVC, animated: true)
    }
    
    func setupNavController(navigationController: UINavigationController) {
        navigationController.hidesBarsOnTap = false
    }
    
    func setupHeader(_ header: UIView) {
        header.clipsToBounds = true
    }
    
    func setupSearchBar(_ searchBar: UISearchBar) {
        let searchField = searchBar.value(forKey: "searchField") as? UITextField

        if let field = searchField {
            
            ///Set cornerRadiuses
            field.layer.cornerRadius = 16
            
            ///Set colors
            field.textColor = .black
            field.tintColor = .biologyGreenColor
            
            ///Set font
            field.font = UIFont(name: "AvenirNext-Medium", size: 15)

            ///Set masksToBounds
            field.layer.masksToBounds = true
            
            ///Set KeyType
            field.returnKeyType = .search
        }
    }
}
