//
//  TextErrorsProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension ForTodayViewController {
    func textErrorsShow() {
        do {
            try textErrorSetup()
          
        } catch ForTodayErrors.Errors.textViewIsntReadyForSave {
            FastAlert.showBasic(title: BasicTestWords.errorWord, message: "Your note content is empty.", vc: self)
            
        } catch ForTodayErrors.Errors.textFieldIsntReadyForSave {
            FastAlert.showBasic(title: BasicTestWords.errorWord, message: "Your note title is empty.", vc: self)
            
        } catch ForTodayErrors.Errors.textViewContentBackHidden {
            FastAlert.showBasic(title: BasicTestWords.errorWord, message: "Your note content is empty.", vc: self)
            
        } catch ForTodayErrors.Errors.textFieldContentBackHidden {
            FastAlert.showBasic(title: BasicTestWords.errorWord, message: "Your note title is empty.", vc: self)
            
        } catch {
            FastAlert.showBasic(title: BasicTestWords.sorryWord, message: "The application has an unknown problem.", vc: self)
        }
    }
}
