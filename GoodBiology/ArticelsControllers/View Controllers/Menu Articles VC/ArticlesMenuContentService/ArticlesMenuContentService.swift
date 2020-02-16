//
//  ArticlesMenuContentService.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation

class ArticlesMenuContentService {
    static func articlesMenuDataProfile(compelition:((_ json: Data?) -> Void)) {
        compelition(Data(articlesMenuContent.utf8))
    }
}

