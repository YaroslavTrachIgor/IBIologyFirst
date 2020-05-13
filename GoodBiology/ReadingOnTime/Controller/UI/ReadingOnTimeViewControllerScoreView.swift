//
//  ReadingOnTimeViewControllerScoreView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 14.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol ReadingOnTimeViewControllerScoreViewSetupProtocol {
    func setupView()
}

final class ReadingOnTimeViewControllerScoreView: ContentBack {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
}

extension ReadingOnTimeViewControllerScoreView: ReadingOnTimeViewControllerScoreViewSetupProtocol {
    func setupView() {
        setupCornerRadius()
    }
}

extension ReadingOnTimeViewControllerScoreView {
    private func setupCornerRadius() {
        layer.cornerRadius = 8
    }
}
