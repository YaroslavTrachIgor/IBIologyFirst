//
//  TransformImageView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 01.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol TransformImageViewSetupProtocol {
    func setupImageView()
}

class TransformImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupImageView()
    }
}

extension TransformImageView: TransformImageViewSetupProtocol {
    func setupImageView() {
        transform = CGAffineTransform(scaleX: 0, y: 0)
    }
}
