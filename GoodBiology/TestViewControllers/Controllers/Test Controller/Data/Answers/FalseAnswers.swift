//
//  False Answers.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 03.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class FalseAnswers {
    let isFalse = "False Answer"
    
    func setFalseAnswers() {
        PlantsTestsData.firstPage_SecondAnswer      = isFalse
        PlantsTestsData.secondPage_FirstAnswer      = isFalse
        PlantsTestsData.thirdPage_SecondAnswer      = isFalse
        
        AnimalsTestsData.firstPage_FirstAnswer      = isFalse
        AnimalsTestsData.secondPage_SecondAnswer    = isFalse
        AnimalsTestsData.thirdPage_FirstAnswer      = isFalse
        
        HumenTestsData.firstPage_SecondAnswer       = isFalse
        HumenTestsData.secondPage_SecondAnswer      = isFalse
        HumenTestsData.thirdPage_FirstAnswer        = isFalse
        
        FungusesTestsData.firstPage_SecondAnswer    = isFalse
        FungusesTestsData.secondPage_SecondAnswer   = isFalse
        FungusesTestsData.thirdPage_SecondAnswer    = isFalse
        
        MicrobesTestsData.firstPage_FirstAnswer     = isFalse
        MicrobesTestsData.secondPage_FirstAnswer    = isFalse
        MicrobesTestsData.thirdPage_SecondAnswer    = isFalse
        
        ArchaeaTestsData.firstPage_SecondAnswer     = isFalse
        ArchaeaTestsData.secondPage_FirstAnswer     = isFalse
        ArchaeaTestsData.thirdPage_SecondAnswer     = isFalse
        
        VirusesTestsData.firstPage_FirstAnswer      = isFalse
        VirusesTestsData.secondPage_FirstAnswer     = isFalse
        VirusesTestsData.thirdPage_SecondAnswer     = isFalse
    }
}
