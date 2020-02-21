//
//  UIActivityView.swift
//  GoodBiology
//
//  Created by Yaroslav on 21.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

func fastActivityVC(item: String) {
    let activityVC = UIActivityViewController(activityItems: [item], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        
    UIApplication.shared.keyWindow?.tintColor = lazyColor
        
    present(activityVC, animated: true)
}
