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
    
    let plantsTestsData     = PlantsTestsData()
    let animalsTestsData    = AnimalsTestsData()
    let humenTestsData      = HumenTestsData()
    let fungusesTestsData   = FungusesTestsData()
    let microbesTestsData   = MicrobesTestsData()
    let virusesTestData     = VirusesTestsData()
    let archaeaTestsData    = ArchaeaTestsData()
    
    func setFalseAnswers() {
        plantsTestsData.firstPage_SecondAnswer = isFalse
        plantsTestsData.secondPage_FirstAnswer = isFalse
        plantsTestsData.thirdPage_SecondAnswer = isFalse
        
        animalsTestsData.firstPage_FirstAnswer   = isFalse
        animalsTestsData.secondPage_SecondAnswer = isFalse
        animalsTestsData.thirdPage_FirstAnswer   = isFalse
        
        humenTestsData.firstPage_SecondAnswer  = isFalse
        humenTestsData.secondPage_SecondAnswer = isFalse
        humenTestsData.thirdPage_FirstAnswer   = isFalse
        
        fungusesTestsData.firstPage_SecondAnswer  = isFalse
        fungusesTestsData.secondPage_SecondAnswer = isFalse
        fungusesTestsData.thirdPage_SecondAnswer  = isFalse
        
        microbesTestsData.firstPage_FirstAnswer  = isFalse
        microbesTestsData.secondPage_FirstAnswer = isFalse
        microbesTestsData.thirdPage_SecondAnswer = isFalse
        
        archaeaTestsData.firstPage_SecondAnswer = isFalse
        archaeaTestsData.secondPage_FirstAnswer = isFalse
        archaeaTestsData.thirdPage_SecondAnswer = isFalse
        
        virusesTestData.firstPage_FirstAnswer  = isFalse
        virusesTestData.secondPage_FirstAnswer = isFalse
        virusesTestData.thirdPage_SecondAnswer = isFalse
    }
}
