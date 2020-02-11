//
//  True Answers.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 03.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation

class TrueAnswers {
    let isTrue = "True Answer"
    
    func setFalseAnswers() {
        
        PlantsTestsData.firstPage_FirstAnswer       = isTrue
        PlantsTestsData.secondPage_SecondAnswer     = isTrue
        PlantsTestsData.thirdPage_FirstAnswer       = isTrue
        
        AnimalsTestsData.firstPage_SecondAnswer     = isTrue
        AnimalsTestsData.secondPage_FirstAnswer     = isTrue
        AnimalsTestsData.thirdPage_SecondAnswer     = isTrue
        
        HumenTestsData.firstPage_FirstAnswer        = isTrue
        HumenTestsData.secondPage_FirstAnswer       = isTrue
        HumenTestsData.thirdPage_SecondAnswer       = isTrue
        
        FungusesTestsData.firstPage_FirstAnswer     = isTrue
        FungusesTestsData.secondPage_FirstAnswer    = isTrue
        FungusesTestsData.thirdPage_FirstAnswer     = isTrue
        
        MicrobesTestsData.firstPage_SecondAnswer    = isTrue
        MicrobesTestsData.secondPage_SecondAnswer   = isTrue
        MicrobesTestsData.thirdPage_FirstAnswer     = isTrue
        
        ArchaeaTestsData.firstPage_FirstAnswer      = isTrue
        ArchaeaTestsData.secondPage_SecondAnswer    = isTrue
        ArchaeaTestsData.thirdPage_FirstAnswer      = isTrue
        
        VirusesTestsData.firstPage_SecondAnswer     = isTrue
        VirusesTestsData.secondPage_SecondAnswer    = isTrue
        VirusesTestsData.thirdPage_FirstAnswer      = isTrue
    }
}
