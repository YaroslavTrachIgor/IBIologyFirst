//
//  True Answers.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 03.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation

class TrueAnswers {
    let plantsTestsData     = PlantsTestsData()
    let animalsTestsData    = AnimalsTestsData()
    let humenTestsData      = HumenTestsData()
    let fungusesTestsData   = FungusesTestsData()
    let microbesTestsData   = MicrobesTestsData()
    let virusesTestData     = VirusesTestsData()
    let archaeaTestsData    = ArchaeaTestsData()
    
    func setFalseAnswers() {
        let isTrue = "True Answer"
        
        plantsTestsData.firstPage_FirstAnswer   = isTrue
        plantsTestsData.secondPage_SecondAnswer = isTrue
        plantsTestsData.thirdPage_FirstAnswer   = isTrue
        
        animalsTestsData.firstPage_SecondAnswer = isTrue
        animalsTestsData.secondPage_FirstAnswer = isTrue
        animalsTestsData.thirdPage_SecondAnswer = isTrue
        
        humenTestsData.firstPage_FirstAnswer  = isTrue
        humenTestsData.secondPage_FirstAnswer = isTrue
        humenTestsData.thirdPage_SecondAnswer = isTrue
        
        fungusesTestsData.firstPage_FirstAnswer   = isTrue
        fungusesTestsData.secondPage_FirstAnswer  = isTrue
        fungusesTestsData.thirdPage_FirstAnswer   = isTrue
        
        microbesTestsData.firstPage_SecondAnswer   = isTrue
        microbesTestsData.secondPage_SecondAnswer  = isTrue
        microbesTestsData.thirdPage_FirstAnswer    = isTrue
        
        archaeaTestsData.firstPage_FirstAnswer     = isTrue
        archaeaTestsData.secondPage_SecondAnswer   = isTrue
        archaeaTestsData.thirdPage_FirstAnswer     = isTrue
        
        virusesTestData.firstPage_SecondAnswer  = isTrue
        virusesTestData.secondPage_SecondAnswer = isTrue
        virusesTestData.thirdPage_FirstAnswer   = isTrue
    }
}
