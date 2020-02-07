//
//  TestErrors.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 07.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation

class TestErrors {
    enum CancellingErrors: Error {
        case answerIsDefault
        case cancel
    }
    
    enum DoneErrors: Error {
        case doneTest
        case answerIsDefault
    }
}
