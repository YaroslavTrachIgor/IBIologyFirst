//
//  FastActivityVC.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 26.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class FastActivityVC {
    static func show(item: String, vc: UIViewController) {
        let activityVC = UIActivityViewController(activityItems: [item], applicationActivities: nil)
        UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        vc.present(activityVC, animated: true)
    }
}
