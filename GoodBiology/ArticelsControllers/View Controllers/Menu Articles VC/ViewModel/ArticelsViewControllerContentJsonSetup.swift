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
    func setJsonData(label: UILabel, textView: UITextView, contentJsonID: String, titleJsonID: String, articlePreviewJsonID: String, vc: UIViewController)
}

extension ArticelsViewControllerViewModel: ArticelsViewControllerContentJsonSetup {
    func setJsonData(label: UILabel, textView: UITextView, contentJsonID: String, titleJsonID: String, articlePreviewJsonID: String, vc: UIViewController) {
        ArticlesMenuContentService.articlesMenuDataProfile { (jsonData) in
            do {
                guard let jData  = jsonData else { return }
                let defaultValue = ""
                
                typealias JsonObjectType = [String: Any]
                if let json = try JSONSerialization.jsonObject(with: jData, options: []) as? JsonObjectType {
                    typealias JsonDataGetType = Array<Dictionary<String, String>>
                    if let content = json[contentJsonID] as? JsonDataGetType {
                        for articleContent in content {
                            DispatchQueue.main.async {
                                label.text    = articleContent[titleJsonID] ?? defaultValue
                                textView.text = articleContent[articlePreviewJsonID] ?? defaultValue
                            }
                        }
                    }
                }
            } catch let error {
                DispatchQueue.main.async {
                    FastAlert.showBasic(title: "Error", message: error.localizedDescription, vc: vc)
                }
            }
        }
    }
}
