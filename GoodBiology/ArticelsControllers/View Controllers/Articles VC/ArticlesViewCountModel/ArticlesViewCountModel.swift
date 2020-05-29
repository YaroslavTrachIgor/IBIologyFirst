//
//  ArticlesViewCountModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 10.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import RealmSwift

//MARK: - ArticlesViewCountModel
class ArticlesViewCountModel: Object {
    @objc dynamic var plantsViewCount    = 0
    @objc dynamic var animalsViewCount   = 0
    @objc dynamic var microbesViewCount  = 0
    @objc dynamic var archaeaViewCount   = 0
    @objc dynamic var virusesViewCount   = 0
    @objc dynamic var fungusesViewCount  = 0
    @objc dynamic var humenViewCount     = 0
    @objc dynamic var chromistaViewCount = 0
}



//MARK: - ArticlesViewCountModelProperties
class ArticlesViewCountModelProperties {
    /// Model
    static let model = ArticlesViewCountModel()
    
    /// DataBase
    static let realm = try? Realm()
}
