//
//  UIView.swift
//  GoodBiology
//
//  Created by Yaroslav on 21.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class NavigationTitleView: UIView {
    private var contentStackView    = UIStackView()
    private var titleLabel          = UILabel()
    private var subTitleLabel       = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        viewConfig()
        addViewsConfig()
        layoutViewsConfig()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(title: String, subTitle: String) {
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
    }

    private func viewConfig() {
        contentStackView.axis = .vertical
        contentStackView.alignment = .center
        contentStackView.distribution  = .fill
        contentStackView.spacing = 5


        self.backgroundColor = .clear
        self.titleLabel.textColor = .darkGray
        self.subTitleLabel.textColor = .gray
    }

    private func addViewsConfig() {
        contentStackView.addArrangedSubview(subTitleLabel)
        contentStackView.addArrangedSubview(titleLabel)
        
        self.addSubview(contentStackView)

    }

    private func layoutViewsConfig() {
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0.0).isActive = true
        contentStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0.0).isActive = true
    }
}


class ContentBack: UIView {
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setupView()
    }

    private func setupView() {
        cornerRadius = 20
        
        backgroundColor     = .systemBackground
        layer.cornerRadius  = cornerRadius
        
        viewShadows()
    }
}
extension UIView {
    public func viewGradient() {
        // Gradient Bachground for all View Controllers
        
        self.setGradientBackground(colorOne: #colorLiteral(red: 0.9216988683, green: 0.9259644747, blue: 0.936390698, alpha: 1), colorTwo: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    }
    
    public func viewSizingInPast() {
        self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
    }
    
    public func editorsViews() {
        // This views usings in the articles. These views always contains UIStepper or UISwitch.
        self.viewShadows()
        
        self.isHidden           = true
        self.layer.cornerRadius = CGFloat(cornerRadius)
    }
}

protocol StepperViewDelegate {
    func setupStepperView()
}

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

extension StepperView: StepperViewDelegate {
    internal func setupStepperView() {
        editorsViews()
    }
}

class TestStepperView: StepperView {
    override init(frame: CGRect) {
      super.init(frame: frame)
        setupTestStepperView()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
        setupTestStepperView()
    }
    
    private func setupTestStepperView() {
        isHidden = true
        
        layer.shadowColor  = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        layer.shadowRadius = 4
    }
}

