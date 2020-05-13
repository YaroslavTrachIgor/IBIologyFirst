//
//  ForTodayViewControllerSaveFunctionSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol ForTodayViewControllerSaveFunctionSetupProtocol {
    
    /// Tab on save button
    func saveNotes()
    
    /// Shows Alert to say tha user has to save his notes
    func saveAlert()
}

extension ForTodayViewController: ForTodayViewControllerSaveFunctionSetupProtocol {
    func saveNotes() {
 
        /// Realm
        headerPost()
        
        /// Errors
        textErrorsShow()
        
        /// Main Alert Controller
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        /// Save Acion
        let saveAction = UIAlertAction(title: saveWord, style: .default) { [unowned self]
            (action) in
            self.saveStringData()
            
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
            self.present(alert, animated: true)
            
            /// setup UIActivityIndicatorView
            let indicator = UIActivityIndicatorView(frame: alert.view.bounds)
            self.setupSaveIndicator(indicator: indicator, with: alert)
            
            /// Show save alert
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                UIView.animate(withDuration: 0, animations: {
                    self.setupSaveAlert(alert: alert, indicator: indicator)
                })
            }
        }
        
        /// Delete Action
        let deleteAction = UIAlertAction(title: deleteWord, style: .destructive) {
            (action) in
            self.trash()
        }
        
        /// Cancel Action
        let cancel = UIAlertAction(title: cancelWord, style: .cancel) {
                (action) in }
        
        /// Set alert font
        alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
        alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
        
        /// Set alert actions
        alertController.addAction(saveAction)
        alertController.addAction(deleteAction)
        alertController.addAction(cancel)
        
        /// Set Tint color
        alertController.view.tintColor = .biologyGreenColor
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func saveAlert() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            FastAlert.showBasic(title: "😯",
                                message: "Remember to save your notes !",
                                vc: self)
        }
    }
    
    
    //MARK: - Private
    private func setupLastSaveDate() {
        let date = LocalizedDate("us", datePosix: "MMMM d  'at'  h:mm a")
        
        /// Set Label text
        lastSaveDateLabel.text = "Last Save: " + date.returnDate() //Date in English
        
        /// Save Label text
        defaults.setValue(lastSaveDateLabel.text!, forKey: Keys.lastSaveLabelKey)
    }
    
    private func setupSaveAlert(alert: UIAlertController, indicator: UIActivityIndicatorView) {
        let alertAction = UIAlertAction(title: "Continue", style: .cancel) { (_) in
            self.setupLastSaveDate()
        }
        
        /// Set Font
        alert.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
        alert.setMessage(font: UIFont(name: BasicFonts.mediumFont, size: 13), color: .none)
        
        /// Set new title
        alert.title = "Information saved 👍🏼"
        
        /// Set tint Color
        alert.view.tintColor = .biologyGreenColor
        
        /// Set Action
        alert.addAction(alertAction)
        
        indicator.stopAnimating()
        indicator.isHidden                  = true
        indicator.isUserInteractionEnabled  = true
    }
    
    private func setupSaveIndicator(indicator: UIActivityIndicatorView, with alert: UIAlertController) {
        indicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        //add the activity indicator as a subview of the alert controller's view
        alert.view.addSubview(indicator)
        
        indicator.isUserInteractionEnabled = false // required otherwise if there buttons in the UIAlertController you will not be able to press them
        indicator.startAnimating()
        indicator.tintColor = #colorLiteral(red: 0.2819608101, green: 0.3052851307, blue: 0.3391695749, alpha: 1)
        
        indicator.activityIndicatorViewShadow()
        
        indicator.style = .large
        alert.title = " "
    }
}



//MARK: - Add and save Users Notes to database
protocol ForTodayViewControllerRealmProtocol {
    func headerPost()
}

/// Work with 'Realm' database
class ForTodayVCNoteModel: Object {
    @objc dynamic var noteContent = ""
    @objc dynamic var noteHeader = ""
}

extension ForTodayViewController: ForTodayViewControllerRealmProtocol {
    func headerPost() {
        guard let noteContent = inputTextView.text, let noteHeader = inputTextField.text else { return }
        let model = ForTodayVCNoteModel()
        model.noteContent = noteContent
        model.noteHeader  = noteHeader
        try! ArticlesViewCountModelProperties.realm?.write {
            ArticlesViewCountModelProperties.realm?.add(model)
        }
    }
}
