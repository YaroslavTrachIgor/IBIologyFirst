//
//  ContactButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 06.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

// Contact Button(sendButton) for ArticlesReviewViewController and TestsReviewViewController
class ContactButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            setup()
    }
}

extension ContactButton: ContactButtonDelegate {
    func setup() {
        fastButtonCostomizing(background: #colorLiteral(red: 0.01995553821, green: 0.3423653841, blue: 0.1189347133, alpha: 1), titleColor: .white, title: "Contact with Email", corner: 19.4, borderWidth: 4)
        buttonsShadows()
        
        alpha = 0
    }
}

protocol ContactButtonDelegate {
    func setup()
}
