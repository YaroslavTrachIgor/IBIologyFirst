//
//  AlphaImageViewSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - ZeroAlphaImageViewSetupProtocol protocol
protocol ZeroAlphaImageViewSetupProtocol {
    func setupImageView()
}



//MARK: - ZeroAlphaImageView main class
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


//MARK: - ZeroAlphaImageViewSetupProtocol extension
extension ZeroAlphaImageView: ZeroAlphaImageViewSetupProtocol {
    func setupImageView() {
        alpha = 0
    }
}
