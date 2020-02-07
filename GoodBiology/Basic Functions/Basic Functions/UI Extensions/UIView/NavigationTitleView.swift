//
//  NavigationTitleView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 07.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol BasicUINavigationItemProtocol {
    func setTitleText(titleLabel: UILabel, subtitleLabel: UILabel, title: String, subTitle: String)
    func setTitleFont(titleLabel: UILabel, subtitleLabel: UILabel)
    func setTitleTextColor(titleLabel: UILabel, subtitleLabel: UILabel)
    
    func setupStackView(stackView: UIStackView)
}

extension UINavigationItem: BasicUINavigationItemProtocol {
    func setTitleText(titleLabel: UILabel, subtitleLabel: UILabel, title: String, subTitle: String) {
        titleLabel.text    = title
        subtitleLabel.text = subTitle
    }
    
    func setTitleFont(titleLabel: UILabel, subtitleLabel: UILabel) {
        titleLabel.font    = UIFont(name: "AvenirNext-DemiBold", size: 16)
        subtitleLabel.font = UIFont(name: "AvenirNext-Medium", size: 14)
    }
    
    func setTitleTextColor(titleLabel: UILabel, subtitleLabel: UILabel) {
        subtitleLabel.textColor = .gray
        titleLabel.textColor    = .black
    }
    
    func setupStackView(stackView: UIStackView) {
        stackView.distribution  = .equalCentering
        stackView.alignment     = .center
        stackView.axis          = .vertical
        
        self.titleView = stackView
    }
}

extension UINavigationItem {
    func setTitle(_ title: String, subtitle: String) {
        /// Titles
        let titleLabel = UILabel()
        let subtitleLabel = UILabel()
        
        /// StackView
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])

        // Setup StackView
        setupStackView(stackView: stackView)
        
        // Setup Title Labels
        setTitleTextColor(titleLabel: titleLabel, subtitleLabel: subtitleLabel)
        setTitleFont(titleLabel: titleLabel, subtitleLabel: subtitleLabel)
        setTitleText(titleLabel: titleLabel, subtitleLabel: subtitleLabel, title: title, subTitle: subtitle)
    }
}
