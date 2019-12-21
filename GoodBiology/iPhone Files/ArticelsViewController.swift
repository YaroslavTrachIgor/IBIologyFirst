//
//  ArticelsViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/13/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

class ArticelsViewController: UIViewController {

    @IBOutlet weak var plantsBackgroundView: UIView!
    @IBOutlet weak var animalsView: UIView!
    @IBOutlet weak var mushroomsView: UIView!
    @IBOutlet weak var manView: UIView!
    @IBOutlet weak var virusesView: UIView!
    @IBOutlet weak var archaeaView: UIView!
    @IBOutlet weak var microbesView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        plantsBackgroundView.layer.shadowOpacity = 0.5
        plantsBackgroundView.layer.shadowColor = UIColor.darkGray.cgColor
        plantsBackgroundView.layer.shadowRadius = 11
        plantsBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        animalsView.layer.shadowOpacity = 0.5
        animalsView.layer.shadowColor = UIColor.darkGray.cgColor
        animalsView.layer.shadowRadius = 11
        animalsView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        mushroomsView.layer.shadowOpacity = 0.5
        mushroomsView.layer.shadowColor = UIColor.darkGray.cgColor
        mushroomsView.layer.shadowRadius = 11
        mushroomsView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        manView.layer.shadowOpacity = 0.5
        manView.layer.shadowColor = UIColor.darkGray.cgColor
        manView.layer.shadowRadius = 11
        manView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        virusesView.layer.shadowOpacity = 0.5
        virusesView.layer.shadowColor = UIColor.darkGray.cgColor
        virusesView.layer.shadowRadius = 11
        virusesView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        archaeaView.layer.shadowOpacity = 0.5
        archaeaView.layer.shadowColor = UIColor.darkGray.cgColor
        archaeaView.layer.shadowRadius = 11
        archaeaView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        microbesView.layer.shadowOpacity = 0.5
        microbesView.layer.shadowColor = UIColor.darkGray.cgColor
        microbesView.layer.shadowRadius = 11
        microbesView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
}
