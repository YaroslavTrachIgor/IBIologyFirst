//
//  Shadows.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12/22/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

extension UISlider {
    func sliderShadow() {
        self.layer.shadowOpacity = 0.7
        self.layer.shadowColor   = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        self.layer.shadowRadius  = 4
        self.layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UIActivityIndicatorView {
    func activityIndicatorViewShadow() {
        self.layer.shadowOpacity = 0.8
        self.layer.shadowColor   = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.layer.shadowRadius  = 11
        self.layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UIButton {
    func buttonsShadows() {
        self.layer.shadowOpacity = 0.7
        self.layer.shadowColor   = #colorLiteral(red: 0.518887043, green: 0.5204613805, blue: 0.5398985744, alpha: 1)
        self.layer.shadowRadius  = 11
        self.layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
    
    func testButtonsShadows() {
        self.layer.shadowOpacity = 3
        self.layer.shadowColor   = #colorLiteral(red: 0.02162307128, green: 0.3310916722, blue: 0.1151730046, alpha: 1)
        self.layer.shadowRadius  = 4
        self.layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
    
    func testFalseButtonsShadows() {
        self.layer.shadowOpacity = 3
        self.layer.shadowColor   = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        self.layer.shadowRadius  = 4
        self.layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UIView {
    func viewShadows() {
        self.layer.shadowOpacity = 0.4
        self.layer.shadowColor   = #colorLiteral(red: 0.7829735875, green: 0.7770373225, blue: 0.8042520881, alpha: 1)
        self.layer.shadowRadius  = 20
        self.layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UIWebView {
    func webViewShadow() {
        self.layer.shadowOpacity = 0.8
        self.layer.shadowColor   = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.layer.shadowRadius  = 5
        self.layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UIPickerView {
    func pickerViewShadow() {
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor   = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.layer.shadowRadius  = 3
        self.layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UIDatePicker {
    func datePickerShadow() {
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor   = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.layer.shadowRadius  = 3
        self.layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UISegmentedControl {
    func segmentedControlShadow() {
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor   = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.layer.shadowRadius  = 3
        self.layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UIStepper {
    func stepperShadow() {
        self.layer.shadowOpacity = 0.9
        self.layer.shadowColor   = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.layer.shadowRadius  = 4
        self.layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UISwitch {
    func switchShadow() {
        self.layer.shadowOpacity = 0.7
        self.layer.shadowColor   = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.layer.shadowRadius  = 4
        self.layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UITextView {
    func textViewShadow() {
        self.layer.shadowOpacity = 0.7
        self.layer.shadowColor   = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.layer.shadowRadius  = 9
        self.layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UIImageView {
    func imageViewShadow() {
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor   = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.layer.shadowRadius  = 9
        self.layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

extension UILabel {
    func labelShadow() {
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor   = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.layer.shadowRadius  = 6
        self.layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}
