//
//  ForTodayViewControllerSetupMainProtocols.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 13.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

typealias ForTodayViewControllerSetupMainProtocols = MapBasicViewDelegate & NotesDelegate & NotesVCAnimation
extension ForTodayViewController: ForTodayViewControllerSetupMainProtocols {
    func mapViewBasics() {
        mapNotes()
        mapPrefering()
        adressLabelPrefering()
        chekLocationServices()
    }
    
    func notesBasicViewThings() {
        view.viewGradient()
        view.addTapGestureToHideKeyboard()
        
        textColorPrefering()
        cornersPrefering()
        basicThingsPrefering()
        notificationAlertPrefering()
        savingProccesings()
        loadingPrefering()
        chooseDateButtonPulsanting()
        systemBackgroundPrefering()
        UIBarButtonItemAlphaPrefering()
        textContainersTintSetup()
        shadowsPrefering()
        viewModel.setupNavBar(navigationController!.navigationBar)
    }
    
    func setupAnimation() {
        let objectsArray = [textFieldBackground, textViewBackground]
        
        UIView.animate(withDuration: 5) {
            let isEnabled = true
            
            self.viewModel.setBarButtonEnabled(barButtonItem: self.pickerViewShowingButton, enabled: isEnabled)
            self.viewModel.setBarButtonEnabled(barButtonItem: self.mapViewShowingButton,    enabled: isEnabled)
            self.viewModel.setBarButtonEnabled(barButtonItem: self.saveButton,              enabled: isEnabled)
        }
        
        for (index, objects) in objectsArray.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                UIView.animate(withDuration: 0.23, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                    objects?.alpha = 1
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                        UIView.animate(withDuration: 0.23, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                            let alpha: CGFloat = 1
                            let elements = [self.choseTimeButton, self.reminderOutletButton, self.noteCopiedView, self.lastSaveDateLabel]
                            
                            for element in elements {
                                self.viewModel.setViewAlpha(element!, alpha: alpha)
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                // Set Buttons Back alpha with animations
                                UIView.animate(withDuration: 0.4) {
                                    let alpha: CGFloat = 1
                                    
                                    self.viewModel.setViewAlpha(self.deleteButtonBack,          alpha: alpha)
                                    self.viewModel.setViewAlpha(self.blankSheetGoButtonBack,    alpha: alpha)
                                    self.viewModel.setViewAlpha(self.paintingNotesGoButtonBack, alpha: alpha)
                                    self.viewModel.setViewAlpha(self.copyButton,                alpha: alpha)
                                }
                            }
                        }, completion: nil)
                    })
                }, completion: nil)
            }
        }
    }
}
