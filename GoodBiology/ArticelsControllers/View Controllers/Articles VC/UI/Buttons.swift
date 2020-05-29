//
//  Buttons.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 01.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
 
//MARK: - ArticleActivityIndicatorView
//MARK: ArticleActivityIndicatorView main class
final class ArticleActivityIndicatorView: UIActivityIndicatorView {
    let activityIndicatorViewstyle = UIActivityIndicatorView.Style.medium
    
    override init(style: UIActivityIndicatorView.Style) {
        super.init(style: activityIndicatorViewstyle)
        
        setup()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
}



//MARK: ArticleActivityIndicatorViewDelegate extension
extension ArticleActivityIndicatorView: ArticleActivityIndicatorViewDelegate {
    func setup() {
        activityIndicatorStarts(colorOfActivity: .darkGray)
    }
}



//MARK: ArticleActivityIndicatorViewDelegate protocol
protocol ArticleActivityIndicatorViewDelegate {
    func setup()
}



//MARK: -  Buttons
//MARK: VideoButtonDelegate protocol
protocol VideoButtonDelegate {
    func setup()
}



//MARK: VideoButton main class
final class VideoButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
}



//MARK: VideoButtonDelegate extension
extension VideoButton: VideoButtonDelegate {
    func setup() {
        videoButton()
    }
}



//MARK: - Image Button
//MARK: ImageButton main class
final class ImageButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
}



//MARK: ImageButtonDelegate protocol
protocol ImageButtonDelegate {
    func setup()
}



//MARK: ImageButtonDelegate extension
extension ImageButton: ImageButtonDelegate {
    func setup() {
        imageButton()
    }
}



//MARK: -  Notification Button
//MARK: NotificationButton main class
final class NotificationButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupButton()
    }
}



//MARK: NotificationButtomDelegate protocol
protocol NotificationButtomDelegate {
    func setupButton()
}



//MARK: NotificationButtomDelegate extension
extension NotificationButton: NotificationButtomDelegate {
    func setupButton() {
        notificationButtonBasics()
        buttonsShadows()
    }
}



//MARK: - Setup second pulse animation
//MARK: Notification Button (UIButton) setup animation
extension UIButton {
    public func addNotificationButtonPulse(view: UIView) {
        let pulse = Pulsing(numberOfPulses: 2, radius: 200, position: self.center)
        
        pulse.animationDuration = 0.9
        pulse.backgroundColor = UIColor.biologyGreenColor.cgColor
        
        view.layer.insertSublayer(pulse, below: self.layer)
    }
}



//MARK: - NotificationButtonBasicFunctionsProtocol protocol
protocol NotificationButtonBasicFunctionsProtocol {
    func notificationButtonBasicFunctions(_ view: UIView)
}



//MARK: - NotificationButtonBasicFunctionsProtocol extension
extension UIButton: NotificationButtonBasicFunctionsProtocol {
    func notificationButtonBasicFunctions(_ view: UIView) {
        notificationButtonAudio()
        settingTittleForNotificationButton()
        addNotificationButtonPulse(view: view)
        pulsate()
    }
}
