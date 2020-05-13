//
//  ArticelsViewControllerContentJsonSetup.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol ArticelsViewControllerContentJsonSetup {
    func contentJsonSetup()
    func errorShow(_ message: String)
}

extension ArticelsViewController: ArticelsViewControllerContentJsonSetup {
    func errorShow(_ message: String) {
        FastAlert.showBasic(title: "Error", message: message, vc: self)
    }
    
    func contentJsonSetup() {
        ArticlesMenuContentService.articlesMenuDataProfile { (jsonData) in
            do {
                guard let jData  = jsonData else { return }
                let defaultValue = ""
                
                if let json = try JSONSerialization.jsonObject(with: jData, options: []) as? [String: Any] {
                    func setJsonData(label: UILabel, textView: UITextView, contentJsonID: String, titleJsonID: String, articlePreviewJsonID: String) {
                        if let content = json[contentJsonID] as? Array<Dictionary<String, String>> {
                            for articleContent in content {
                                label.text    = articleContent[titleJsonID] ?? defaultValue
                                textView.text = articleContent[articlePreviewJsonID] ?? defaultValue
                            }
                        }
                    }
                    //MARK: Data Give
                    setJsonData(label: plantsLabel, textView: plantTextView, contentJsonID: "PlantsContent", titleJsonID: "PlantsTitle", articlePreviewJsonID: "PlantsArticlePreview")
                    setJsonData(label: animalsLabel, textView: animalTextView, contentJsonID: "AnimalsContent", titleJsonID: "AnimalsTitle", articlePreviewJsonID: "AnimalsArticlePreview")
                    setJsonData(label: humanLabel, textView: humanTextView, contentJsonID: "HumanContent", titleJsonID: "HumanTitle", articlePreviewJsonID: "HumanArticlePreview")
                    setJsonData(label: microbesLabel, textView: microbeTextView, contentJsonID: "MicrobesContent", titleJsonID: "MicrobesTitle", articlePreviewJsonID: "MicrobesArticlePreview")
                    setJsonData(label: virusesLabel, textView: virusTextView, contentJsonID: "VirusesContent", titleJsonID: "VirusesTitle", articlePreviewJsonID: "VirusesArticlePreview")
                    setJsonData(label: archaeaLabel, textView: archaeaTextView, contentJsonID: "ArchaeaContent", titleJsonID: "ArchaeaTitle", articlePreviewJsonID: "ArchaeaArticlePreview")
                    setJsonData(label: chromistaLabel, textView: chromistaTextView, contentJsonID: "ChromistaContent", titleJsonID: "ChromistaTitle", articlePreviewJsonID: "ChromistaArticlePreview")
                    setJsonData(label: fungusesLabel, textView: fungusTextView, contentJsonID: "FungusesContent", titleJsonID: "FungusesTitle", articlePreviewJsonID: "FungusesArticlePreview")
                }
            } catch let error {
                errorShow(error.localizedDescription)
            }
        }
    }
}
