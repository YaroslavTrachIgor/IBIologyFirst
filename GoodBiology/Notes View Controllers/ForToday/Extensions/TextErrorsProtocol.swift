//
//  TextErrorsProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol TextErrorsProtocol {
    func textErrorsShow()
}

extension ForTodayViewController: TextErrorsProtocol {
    func textErrorsShow() {
        do {
            try textErrorSetup()
          
        } catch ForTodayErrors.Errors.textViewIsntReadyForSave {
            FastAlert.showBasic(title: errorWord, message: "Your note content is empty.", vc: self)
            
        } catch ForTodayErrors.Errors.textFieldIsntReadyForSave {
            FastAlert.showBasic(title: errorWord, message: "Your note title is empty.", vc: self)
            
        } catch ForTodayErrors.Errors.textViewContentBackHidden {
            FastAlert.showBasic(title: errorWord, message: "Your note content is empty.", vc: self)
            
        } catch ForTodayErrors.Errors.textFieldContentBackHidden {
            FastAlert.showBasic(title: errorWord, message: "Your note title is empty.", vc: self)
            
        } catch {
            FastAlert.showBasic(title: sorryWord, message: "The application has an unknown problem.", vc: self)
        }
    }
}
