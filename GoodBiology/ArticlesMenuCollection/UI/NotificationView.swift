//
//  NotificationView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 19.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - NotificationViewProtocol protocol
protocol NotificationViewProtocol {
    func setupView()
}

class NotificationView: UIView {
    
    //MARK: @IBOutlets
    @IBOutlet weak var dateLabel: UILabel! { didSet {
        let date = LocalizedDate("us", datePosix: "MMMM d  'at'  h:mm a")
        
        /// Set Label text
        dateLabel.text = "Date: " + date.returnDate() //Date in English
    } }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
}



//MARK: - NotificationViewProtocol
extension NotificationView: NotificationViewProtocol {
    func setupView() {
        
        ///Set constraint
        let active = true
        heightAnchor.constraint(equalToConstant: 65).isActive = active
        widthAnchor.constraint(equalToConstant: 360).isActive = active
        
        /// Set backgroundColor
        backgroundColor = .biologyGreenColor
        
        /// Set corners
        layer.cornerRadius = 10
    }
}



//MARK: NotificationView Main Functions
extension NotificationView {
    static func instanceFromNib() -> UIView {
        return UINib(nibName: "NotificationView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}

