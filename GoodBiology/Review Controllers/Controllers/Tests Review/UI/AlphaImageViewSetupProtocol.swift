//
//  AlphaImageViewSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol ZeroAlphaImageViewSetupProtocol {
    func setupImageView()
}

class ZeroAlphaImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupImageView()
    }
}

extension ZeroAlphaImageView: ZeroAlphaImageViewSetupProtocol {
    func setupImageView() {
        alpha = 0
    }
}
