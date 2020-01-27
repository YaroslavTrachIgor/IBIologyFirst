//
//  Buttons.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 01.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class ArticleActivityIndicatorView: UIActivityIndicatorView {
    override init(style: UIActivityIndicatorView.Style) {
        super.init(style: .medium)
        
        setup()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
}

extension ArticleActivityIndicatorView: ArticleActivityIndicatorViewDelegate {
    func setup() {
        activityIndicatorStarts(colorOfActivity: .darkGray)
    }
}

protocol ArticleActivityIndicatorViewDelegate {
    func setup()
}

// Notification Button

class VideoButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            setup()
    }
}

extension VideoButton: VideoButtonDelegate {
    func setup() {
        videoButton()
    }
}

protocol VideoButtonDelegate {
    func setup()
}

// Video Button

class ImageButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            setup()
    }
}

extension ImageButton: ImageButtonDelegate {
    func setup() {
        imageButton()
    }
}

protocol ImageButtonDelegate {
    func setup()
}

// Image Button

class NotificationButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            setup()
    }
}

extension NotificationButton: NotificationButtomDelegate {
    func setup() {
        notificationButtonBasics()
        buttonsShadows()
    }
}

protocol NotificationButtomDelegate {
    func setup()
}
