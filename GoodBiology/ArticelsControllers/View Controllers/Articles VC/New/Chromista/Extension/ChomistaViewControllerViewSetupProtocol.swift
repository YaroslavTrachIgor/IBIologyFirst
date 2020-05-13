//
//  ChomistaViewControllerViewSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 06.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension ChomistaViewController: ChomistaViewControllerViewSetupProtocol {
    func alphaSetup() {
        let alpha: CGFloat = 0
        
        historyTextViewBack.alpha   = alpha
        textViewBack.alpha          = alpha
        structureTextViewBack.alpha = alpha
    }
    
    func contentSetup() {
        structureTextView.text =
        """
        Chromista has been defined in different ways at different times. The name Chromista was first introduced by Cavalier-Smith in 1981; the earlier names Chromophyta, Chromobiota and Chromobionta correspond to roughly the same group.

        It has been described as consisting of three different groups:

        Heterokonts or stramenopiles: brown algae, diatoms, water moulds, etc.
        Haptophytes
        Cryptomonads
        
        In 2010, Thomas Cavalier-Smith indicated his desire to move Alveolata, Rhizaria and Heliozoa into Chromista.

        Some examples of classification of the Chromista and related groups are shown below.
        """
    }
    
    func cornersSetup() {
        cornerRadius = 22
        
        textView.layer.cornerRadius          = cornerRadius
        structureTextView.layer.cornerRadius = cornerRadius
        historyTextView.layer.cornerRadius   = cornerRadius
    }
    
    func shadowsSetup() {
        textView.textViewShadow()
        structureTextView.textViewShadow()
    }
    
    func backViewSetup() {
        if #available(iOS 13.0, *) {
            view.backgroundColor = .secondarySystemBackground
            navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        }
    }
}
