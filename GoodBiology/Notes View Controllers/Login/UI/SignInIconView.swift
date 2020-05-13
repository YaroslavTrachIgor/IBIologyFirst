//
//  SignInIconView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 28.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol SignInIconImageProtocol {
    func setupImageView()
}

class SignInIconImage: UIImageView {
    
    let viewModel = SignInIconImageViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupImageView()
    }
}

extension SignInIconImage: SignInIconImageProtocol {
    func setupImageView() {
        setupImage()
        setupTint()
    }
}

extension SignInIconImage {
    private func setupImage() {
        viewModel.setupImage(self)
    }
    
    private func setupTint() {
        viewModel.setupTint(self)
    }
}

class SignInIconImageViewModel {
    func setupImage(_ imageView: UIImageView) {
        if DeviceType.IS_IPHONE_7 || DeviceType.IS_IPHONE_7P || DeviceType.IS_IPHONE_5 {
            imageView.image = UIImage(systemName: "")
        } else {
            imageView.image = UIImage(systemName: "faceid")
        }
    }
    
    func setupTint(_ imageView: UIImageView) {
        imageView.tintColor = .black
    }
}
