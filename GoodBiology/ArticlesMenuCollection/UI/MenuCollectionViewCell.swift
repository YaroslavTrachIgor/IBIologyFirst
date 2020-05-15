//
//  MenuCollectionViewCell.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 09.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

// MARK: - MenuCollectionViewCellProtocol
protocol MenuCollectionViewCellProtocol {
    func setupCollectionViewCell()
}


// MARK: - MenuCollectionViewCell
class MenuCollectionViewCell: UICollectionViewCell {
    
    //MARK: @IBOutlets
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var cellTextView: UITextView!
    
    // UIButtons
    @IBOutlet weak var addToNotesButton: MenuCollectionViewCellButton!
    @IBOutlet weak var showArticleButton: MenuCollectionViewCellButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCollectionViewCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupCollectionViewCell()
    }
}



// MARK: - @IBAction
extension MenuCollectionViewCell {
    @IBAction func addToNotes(sender: UIButton) {
        /// Push Notifications
        setupNotification()
        showNotificateionAlert()
        notificationCellAnimation()
    }
}



// MARK: - MenuCollectionViewCellProtocol extension
extension MenuCollectionViewCell: MenuCollectionViewCellProtocol {
    func setupCollectionViewCell() {
        setupShadow()
        setupCorners()
    }
}


// MARK: - Main Functions
extension MenuCollectionViewCell {
    private func setupCorners() {
        layer.cornerRadius = 12
    }
    
    private func setupShadow() {
        viewShadows()
    }
    
    private func setupNotification() {
        PushNotifications.setupBasicNotification(body: headerLabel.text!, inSecond: TimeInterval(timeInterval)) { (_) in }
        
        ///For Analytics
        AnalyticsManeger.addNotificationAnalytics(article: headerLabel.text! + "_CollectionView")
    }
    
    private func showNotificateionAlert() {
        let notificationAlert = UIAlertController(title: nil, message: "A reminder for an \(headerLabel.text!) article was set !", preferredStyle: .alert)
        let notificationAlertAction = UIAlertAction(title: "Continue", style: .cancel, handler: nil)
        
        /// add Action
        notificationAlert.addAction(notificationAlertAction)
        
        /// present alert
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            self.window?.rootViewController?.present(notificationAlert, animated: true)
        }
    }
    
    private func notificationCellAnimation() {
        /// Use for cycle to maka animation greener
        for _ in 0...5 { addToNotesButton.addNotificationButtonPulse(view: self) }
    }
}
