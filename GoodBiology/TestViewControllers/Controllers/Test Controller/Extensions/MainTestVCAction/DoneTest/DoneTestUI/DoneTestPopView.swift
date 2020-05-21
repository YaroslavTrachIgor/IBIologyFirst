//
//  DoneTestPopView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 19.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol DoneTestPopViewProtocol {
    func setupView()
}

class DoneTestPopView: UIView {
    
    //MARK: @IBOutlets
    @IBOutlet weak var DoneTestImage: UIImageView!
    @IBOutlet weak var doneTestLabel: UILabel!
    @IBOutlet weak var showScoreButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
}



//MARK: @IBActions
extension DoneTestPopView {
    @IBAction func showScore(_ sender: Any) {
        let vc = (UIApplication.shared.keyWindow?.rootViewController!)!
        
        if TestScores.shared.testScore > 30 {
            FastAlert.showBasic(title: "30/30", message: nil, vc: vc)
            
        } else {
            FastAlert.showBasic(title: "\(TestScores.shared.testScore)/30", message: nil, vc: vc)
            
            ///Set zero Score
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                TestScores.shared.testScore = 0
            }
        }
    }
}



//MARK: DoneTestPopViewProtocol
extension DoneTestPopView: DoneTestPopViewProtocol {
    func setupView() {
        
        /// Set backgroundColor
        backgroundColor = .systemBackground
        
        /// Set constraints
        heightAnchor.constraint(equalToConstant: 300).isActive = true
        widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        /// Set corner radius
        layer.cornerRadius = 20
    }
}



//MARK: DoneTestPopView Main Functions
extension DoneTestPopView {
    static func instanceFromNib() -> UIView {
        return UINib(nibName: "DoneTestPopView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
