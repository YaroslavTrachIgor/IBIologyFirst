//
//  ArticlesContentService.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 16.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation

class ArticlesContentService {
    static func articlesDataProfile(compelition:((_ json: Data?) -> Void)) {
        compelition(Data(articlesJsonData.utf8))
    }
}
