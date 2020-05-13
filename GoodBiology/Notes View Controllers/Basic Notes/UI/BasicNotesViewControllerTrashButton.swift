//
//  BasicNotesViewControllerTrashButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 02.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol BasicNotesViewControllerTrashButtonSetupProtocol {
    func setupButton()
}

final class BasicNotesViewControllerTrashButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButton()
    }
}

extension BasicNotesViewControllerTrashButton: BasicNotesViewControllerTrashButtonSetupProtocol {
    func setupButton() {
        setupShadow()
    }
}

extension BasicNotesViewControllerTrashButton {
    private func setupShadow() {
        viewShadows()
    }
    
    private func setupCorners() {
        layer.cornerRadius = 15
    }
}
