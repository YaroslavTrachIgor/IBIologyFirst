//
//  StoryBoardConstants.swift
//  GoodBiology
//
//  Created by Denys Volkov on 2020-02-20.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation

enum StoryBoardConstants {
    enum Main: String {
        static let id = "Main"
        
        case article = "ArticlesNavigationController"
    }
    
    enum Biology: String {
        static let id = "Biology"
        
        case main = "BasicsNavigationController"
    }
    
    enum ForToday: String {
        static let id = "ForToday"
        
        case main = "Main"
    }
}
