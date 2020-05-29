//
//  StepperView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 07.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - StepperViewProtocol
protocol StepperViewProtocol {
    func setupStepperView()
}



//MARK: - StepperView main class
class StepperView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStepperView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupStepperView()
    }
}



//MARK: - StepperViewProtocol extension
extension StepperView: StepperViewProtocol {
    internal func setupStepperView() {
        editorsViews()
    }
}
