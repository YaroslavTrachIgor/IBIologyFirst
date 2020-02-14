//
//  DrawNotesViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 14.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class DrawNotesViewController: UIViewController {
    
    // DrawViews
    @IBOutlet weak var headerNoteDrawView:  DrawView!
    @IBOutlet weak var noteContentDrawView: DrawView!
    
    // Colors Set Buttons
    @IBOutlet weak var colorButtonsBackView: ContentBack!
    
    // Set Stroke Colors
    @IBOutlet var setColorButtons: [UIButton]!
    
    @IBAction func setRedColor(_ sender: Any) {
        setColor(color: UIColor.systemRed.cgColor)
    }
    
    @IBAction func setBlueColor(_ sender: Any) {
        setColor(color: UIColor.systemBlue.cgColor)
    }
    
    @IBAction func setGreenColor(_ sender: Any) {
        setColor(color: UIColor.systemGreen.cgColor)
    }
    
    @IBAction func setBlackColor(_ sender: Any) {
        setColor(color: UIColor.black.cgColor)
    }
    
    private func setColor(color: CGColor) {
        noteContentDrawView.strokeColor = color
        headerNoteDrawView.strokeColor = color
    }
    
    // Erase
    @IBAction func onEraseTapped(_ sender: Any) {
        noteContentDrawView.erase()
        headerNoteDrawView.erase()
    }
}
