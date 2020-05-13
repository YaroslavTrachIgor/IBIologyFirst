//
//  MostPopularArticlesViewControllerLabel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 03.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol MostPopularArticlesViewControllerLabelProtocol {
    func setupLabel()
}

final class MostPopularArticlesViewControllerLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupLabel()
    }
}

extension MostPopularArticlesViewControllerLabel: MostPopularArticlesViewControllerLabelProtocol {
    func setupLabel() {
        setupColor()
        setupProperty()
    }
}

extension MostPopularArticlesViewControllerLabel {
    private func setupColor() {
        textColor = #colorLiteral(red: 0, green: 0.1784499773, blue: 0.007733824454, alpha: 1)
    }
    
    private func setupProperty() {
        if let title = self.text{
           attributedText = title.getUnderLineAttributedText()
        }
    }
}

extension String {
    func getUnderLineAttributedText() -> NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
}
