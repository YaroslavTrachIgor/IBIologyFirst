//
//  BasicsViewControllerInfoSwitchActionProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 14.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol BasicsViewControllerInfoSwitchActionProtocol {
    func infoSwitchSetup()
}

extension BasicsViewController: BasicsViewControllerInfoSwitchActionProtocol {
    func infoSwitchSetup() {
        switch segmentedControl.selectedSegmentIndex {
            
        case 0:
            if (navigationItem.title == "Basics") {
                contentTextView.text = basics
                
            } else if (navigationItem.title == "History") {
                contentTextView.text = history
                
            } else if (navigationItem.title == "History p. 2") {
                contentTextView.text = history2
                
            } else if (navigationItem.title == "Cell Theory") {
                contentTextView.text = cell
                
            } else if (navigationItem.title == "Evolution") {
                contentTextView.text = evolution
                
            } else if (navigationItem.title == "Genetics") {
                contentTextView.text = genetics
                
            } else if (navigationItem.title == "Structural") {
                contentTextView.text = structular
            }
        case 1:
            if (navigationItem.title == "Basics") {
                contentTextView.text = basicsBasics
                
            } else if (navigationItem.title == "History") {
                contentTextView.text = historyBasics
                
            } else if (navigationItem.title == "History p. 2") {
                contentTextView.text = history2Basics
                
            } else if (navigationItem.title == "Cell Theory") {
                contentTextView.text = cellBasics
                
            } else if (navigationItem.title == "Evolution") {
                contentTextView.text = evolutionBasics
                
            } else if (navigationItem.title == "Genetics") {
                contentTextView.text = geneticsBasics
                
            } else if (navigationItem.title == "Structural") {
                contentTextView.text = structularBasics
            }
        default:
            print("Error")
        }
    }
}
