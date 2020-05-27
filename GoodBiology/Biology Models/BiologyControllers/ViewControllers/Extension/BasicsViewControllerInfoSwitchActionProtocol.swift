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


// MARK: - BasicsViewControllerInfoSwitchActionProtocol
extension BiologyViewController: BasicsViewControllerInfoSwitchActionProtocol {
    struct NavigationItemTitles {
        static let basicsItem       = "Biology Basics"
        static let historyItem      = "History"
        static let cellTheoryItem   = "Cell Theory"
        static let history2Item     = "History p. 2"
        static let evolutionItem    = "Evolution"
        static let geneticsItem     = "Genetics"
        static let structuralItem   = "Structural"
    }
    
    func infoSwitchSetup() {
        switch segmentedControl.selectedSegmentIndex {
            
        case 0:
            if navigationItem.title == NavigationItemTitles.basicsItem {
                contentTextView.text = BiologyAllStringData.MainArticle.basics
                
            } else if navigationItem.title == NavigationItemTitles.historyItem {
                contentTextView.text = BiologyAllStringData.MainArticle.history
                
            } else if navigationItem.title == NavigationItemTitles.history2Item {
                contentTextView.text = BiologyAllStringData.MainArticle.history2
                
            } else if navigationItem.title == NavigationItemTitles.cellTheoryItem {
                contentTextView.text = BiologyAllStringData.MainArticle.cell
                
            } else if navigationItem.title == NavigationItemTitles.evolutionItem {
                contentTextView.text = BiologyAllStringData.MainArticle.evolution
                
            } else if navigationItem.title == NavigationItemTitles.geneticsItem {
                contentTextView.text = BiologyAllStringData.MainArticle.genetics
                
            } else if navigationItem.title == NavigationItemTitles.structuralItem {
                contentTextView.text = BiologyAllStringData.MainArticle.structular
            }
        case 1:
            if navigationItem.title == NavigationItemTitles.basicsItem {
                contentTextView.text = BiologyBasicsStringData.basicsBasics
                
            } else if navigationItem.title == NavigationItemTitles.historyItem {
                contentTextView.text = BiologyBasicsStringData.historyBasics
                
            } else if navigationItem.title == NavigationItemTitles.history2Item {
                contentTextView.text = BiologyBasicsStringData.history2Basics
                
            } else if navigationItem.title == NavigationItemTitles.cellTheoryItem {
                contentTextView.text = BiologyBasicsStringData.cellBasics
                
            } else if navigationItem.title == NavigationItemTitles.evolutionItem {
                contentTextView.text = BiologyBasicsStringData.evolutionBasics
                
            } else if navigationItem.title == NavigationItemTitles.geneticsItem {
                contentTextView.text = BiologyBasicsStringData.geneticsBasics
                
            } else if navigationItem.title == NavigationItemTitles.structuralItem {
                contentTextView.text = BiologyBasicsStringData.structularBasics
            }
        default:
            print("Error")
        }
    }
}
