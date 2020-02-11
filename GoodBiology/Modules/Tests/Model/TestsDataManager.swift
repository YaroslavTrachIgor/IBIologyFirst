//
//  TestsDataManager.swift
//  GoodBiology
//
//  Created by Denys Volkov on 2020-02-08.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation

protocol TestsDatamanagerProtocol {
    func testsList() -> [Test]
}

class TestsDatamanager {
    private var tests: [Test]?
    
    init(modelData: String) {
        guard let data = modelData.data(using: .utf8) else { return }
        tests = try! JSONDecoder().decode([Test].self, from: data)
    }
}
