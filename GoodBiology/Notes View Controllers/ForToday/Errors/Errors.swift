//
//  Errors.swift
//  GoodBiology
//
//  Created by Yaroslav on 22.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation

class ForTodayErrors {
    enum Errors: Error {
        case textViewIsntReadyForSave
        case textFieldIsntReadyForSave
        case textViewContentBackHidden
        case textFieldContentBackHidden
    }
}
