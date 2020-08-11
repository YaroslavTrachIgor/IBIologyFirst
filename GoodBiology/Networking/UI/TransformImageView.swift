//
//  TransformImageView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 01.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - TransformImageViewSetupProtocol protocol
protocol TransformImageViewSetupProtocol {
    func setupImageView()
}



//MARK: - TransformImageView main class
final class TransformImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupImageView()
    }
}



//MARK: - TransformImageViewSetupProtocol extension
extension TransformImageView: TransformImageViewSetupProtocol {
    internal func setupImageView() {
        transform = CGAffineTransform(scaleX: 0, y: 0)
    }
}
