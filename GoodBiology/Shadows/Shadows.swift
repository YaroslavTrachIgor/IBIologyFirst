//
//  Shadows.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12/22/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import WebKit

extension UISlider {
    func sliderShadow() {
        layer.shadowOpacity = 0.7
        layer.shadowColor   = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        layer.shadowRadius  = 4
        layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UIActivityIndicatorView {
    func activityIndicatorViewShadow() {
        layer.shadowOpacity = 0.8
        layer.shadowColor   = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        layer.shadowRadius  = 11
        layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UIButton {
    func buttonsShadows() {
        layer.shadowOpacity = 0.7
        layer.shadowColor  = #colorLiteral(red: 0, green: 0.2469184101, blue: 0.009277993813, alpha: 1)
        layer.shadowRadius = 2.9
        layer.shadowOffset  = CGSize(width: 0, height: 4)
    }
    
    func testButtonsShadows() {
        layer.shadowOpacity = 3
        layer.shadowColor   = #colorLiteral(red: 0, green: 0.2469184101, blue: 0.009277993813, alpha: 1)
        layer.shadowRadius  = 2.2
        layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
    
    func testFalseButtonsShadows() {
        layer.shadowOpacity = 3
        layer.shadowColor   = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        layer.shadowRadius  = 4
        layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UIView {
    func viewShadows() {
        layer.shadowOffset  = CGSize(width: 0, height: 5)
        layer.shadowOpacity = 0.7
        layer.shadowColor   = #colorLiteral(red: 0.8915841755, green: 0.8915841755, blue: 0.8915841755, alpha: 1)
        layer.shadowRadius  = 5
    }
}

extension WKWebView {
    func webViewShadow() {
        layer.shadowOpacity = 0.8
        layer.shadowColor   = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        layer.shadowRadius  = 5
        layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UIPickerView {
    func pickerViewShadow() {
        layer.shadowOpacity = 0.5
        layer.shadowColor   = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        layer.shadowRadius  = 3
        layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UIDatePicker {
    func datePickerShadow() {
        layer.shadowOpacity = 0.5
        layer.shadowColor   = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        layer.shadowRadius  = 3
        layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UISegmentedControl {
    func segmentedControlShadow() {
        layer.shadowOpacity = 0.5
        layer.shadowColor   = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        layer.shadowRadius  = 3
        layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UIStepper {
    func stepperShadow() {
        layer.shadowOpacity = 0.9
        layer.shadowColor   = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        layer.shadowRadius  = 4
        layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UISwitch {
    func switchShadow() {
        layer.shadowOpacity = 0.7
        layer.shadowColor   = #colorLiteral(red: 0, green: 0.1297192259, blue: 0.005621887637, alpha: 1)
        layer.shadowRadius  = 4
        layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UITextView {
    func textViewShadow() {
        layer.shadowOpacity = 0.7
        layer.shadowColor   = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        layer.shadowRadius  = 9
        layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UIImageView {
    func imageViewShadow() {
        layer.shadowOpacity = 0.5
        layer.shadowColor   = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        layer.shadowRadius  = 9
        layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UILabel {
    func labelShadow() {
        layer.shadowOpacity = 0.5
        layer.shadowColor   = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        layer.shadowRadius  = 6
        layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}
