//
//  TestViewControllerProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav on 14.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol TestViewControllerProtocol {
    func otherUIthings()
    func systemBackPrefering()
    func postKeys()
}

extension TestViewController: TestViewControllerProtocol {
    
    func otherUIthings() {
        stepperOutlet.stepperBaics()
        shareButton.isEnabled = false
        answerLabel.text = answerWord
    }
    
    func systemBackPrefering() {
        view.viewSystemBack()
        
        stepperView.viewSystemBack()
    }
    
    func postKeys() {
        guard let title = navigationController?.navigationItem.title else { return }
        
        if title == "Plants Test Final" {
            notificationNameSet(name: TestViewKeys.plantsViewKey)
            //notificationCenterPost()
            
        } else if title == "Animals Test Final" {
            notificationNameSet(name: TestViewKeys.animalsViewKey)
            notificationCenterPost()
            
        } else if title == "Humen Test Final" {
            notificationNameSet(name: TestViewKeys.humanViewKey)
            notificationCenterPost()
            
        } else if title == "Microbes Test Final" {
            notificationNameSet(name: TestViewKeys.microbesViewKey)
            notificationCenterPost()
            
        } else if title == "Viruses Test Final" {
            notificationNameSet(name: TestViewKeys.virusesViewKey)
            notificationCenterPost()
            
        } else if title == "Archaea Test Final" {
            notificationNameSet(name: TestViewKeys.archaeaViewKey)
            notificationCenterPost()
            
        } else if title == "Funguses Test Final" {
            notificationNameSet(name: TestViewKeys.fungusesViewKey)
            notificationCenterPost()
        }
    }
}
