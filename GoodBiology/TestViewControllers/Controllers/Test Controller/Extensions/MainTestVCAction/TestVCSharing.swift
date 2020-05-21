//
//  TestVCSharing.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

//MARK: - Sharing
extension TestViewController {
    
    //MARK: - @IBAction
    @IBAction func sharing(_ sender: Any) {
        share()
        shareAudio()
    }
    
    
    //MARK: - Private
    private func shareAudio() {
        presenter.shareAudio()
    }
    
    private func share() {
        let title = navigationItem.title
        fastActivityVCforTest(item: title ?? .init())
    }
    
    private func fastActivityVCforTest(item: String) {
        presenter.fastActivityVCforTest(item: item, for: self)
    }
}
