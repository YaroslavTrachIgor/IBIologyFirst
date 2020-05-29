//
//  MenuCollectionViewCell.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 09.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import SwiftEntryKit

// MARK: - MenuCollectionViewCellProtocol
protocol MenuCollectionViewCellProtocol {
    func setupCollectionViewCell()
}


// MARK: - MenuCollectionViewCell
class MenuCollectionViewCell: UICollectionViewCell {
    
    //MARK: @IBOutlets
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var cellTextView: UITextView!
    
    // MenuCollectionViewCellButtons
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
        
        // UI animations
        let alertsManeger = AlertsManeger()
        alertsManeger.showNotificationView()
        notificationCellAnimation()
    }
}



// MARK: - MenuCollectionViewCellProtocol extension
extension MenuCollectionViewCell: MenuCollectionViewCellProtocol {
    func setupCollectionViewCell() {
        setupShadow(self)
        setupCorners(self)
    }
}



// MARK: - MenuCollectionViewCellProtocol extension for setup cell
extension MenuCollectionViewCellProtocol {
    func setupCorners(_ cell: MenuCollectionViewCell) {
        cell.layer.cornerRadius = 12
    }
    
    func setupShadow(_ cell: MenuCollectionViewCell) {
        cell.viewShadows()
    }
}



// MARK: - Main Functions
extension MenuCollectionViewCell {
    private func setupNotification() {
        PushNotifications.setupBasicNotification(body: headerLabel.text!, inSecond: TimeInterval(BasicPushNotificationAttributes.timeInterval)) { (_) in }
        
        ///For Analytics
        AnalyticsManeger.addNotificationAnalytics(article: headerLabel.text! + "_CollectionView")
    }

    private func notificationCellAnimation() {
        
        /// Use for cycle to maka animation greener
        for _ in 0...5 { addToNotesButton.addNotificationButtonPulse(view: self) }
    }
}
