//
//  ArticleProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 31.08.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation

protocol ArticlesViewControllerDelegate {
    var articleName: String { get }
    
    func finalView()
}
