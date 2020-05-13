//
//  PupularInfoViewModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 17.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class PupularInfoViewModel {
    func share(text: String,_ vc: UIViewController) {
        let activityVC = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        vc.present(activityVC, animated: true)
    }
    
    func setTitle(navItem: UINavigationItem) {
        navItem.title = "Info"
    }
    
    func addSubview(mainView: UIView, subView: UIView) {
        mainView.addSubview(subView)
    }
    
    func setupMainView(_ view: UIView) {
        view.backgroundColor = .white
        view.tintColor = .biologyGreenColor
    }
    
    func setupRightBarButtonItem(action: Selector?,_ navigationItem: UINavigationItem) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: action)
    }
}
