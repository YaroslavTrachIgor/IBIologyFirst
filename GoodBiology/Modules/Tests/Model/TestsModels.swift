//
//  TestsModels.swift
//  GoodBiology
//
//  Created by Denys Volkov on 2020-02-08.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation

struct Test: Codable {
    let title: String
    let description: String
    let quizes: [Quiz]
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case quizes
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        description = try values.decode(String.self, forKey: .description)
        quizes = try values.decode([Quiz].self, forKey: .quizes)
    }
}

struct Quiz: Codable {
    let title: String
    let questions: [Question]
    
    enum CodingKeys: String, CodingKey {
        case title
        case questions
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        questions = try values.decode([Question].self, forKey: .questions)
    }
}

struct Question: Codable {
    let description: String
    let buttonTitle: String?
    let isRigth: Bool
    
    enum CodingKeys: String, CodingKey {
        case description
        case buttonTitle
        case isRigth
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        description = try values.decode(String.self, forKey: .description)
        buttonTitle = try values.decode(String.self, forKey: .buttonTitle)
        isRigth = try values.decode(Bool.self, forKey: .isRigth)
    }
}
