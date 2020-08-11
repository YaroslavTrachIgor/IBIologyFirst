//
//  LocalizedDate.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 13.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation

//MARK: - LocalizedDate struct
struct LocalizedDate {
    
    /// String
    var location: String
    var datePosix: String
    
    /// DateFormatter
    let dateFormatter = DateFormatter()
    
    /// Date
    let date = Date()
    
    
    //MARK: Init
    init(_ location: String, datePosix: String ){
        self.location = location
        self.datePosix = datePosix
    }
    
    
    //MARK: Public
    public func returnDate() -> String {
        let local = Locale(identifier: location)
        dateFormatter.locale = local
        dateFormatter.setLocalizedDateFormatFromTemplate(datePosix)
        return dateFormatter.string(from: date)
    }
}
