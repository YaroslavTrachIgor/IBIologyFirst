//
//  ArticlesPreviewView.swift
//  GoodBiology
//
//  Created by Yaroslav on 12.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import UIKit

class ArticlesPreviewView: UIView {
    @IBOutlet weak var newArticleLabel: NewArticleLabel!
    
    @IBOutlet weak var plantsView:      ArticlePreviewView!
    @IBOutlet weak var mainView:        ArticlePreviewView!
    @IBOutlet weak var microbesView:    ArticlePreviewView!
    @IBOutlet weak var animalsView:     ArticlePreviewView!
    @IBOutlet weak var archaeaView:     ArticlePreviewView!
    @IBOutlet weak var manView:         ArticlePreviewView!
    @IBOutlet weak var virusesView:     ArticlePreviewView!
    @IBOutlet weak var mushroomsView:   ArticlePreviewView! {
        /// There is a small error here with this view, so I had to set back here
        didSet { mushroomsView.backgroundColor = #colorLiteral(red: 0.9828680203, green: 0.9828680203, blue: 0.9828680203, alpha: 1) }
    }
    @IBOutlet weak var chromistaView:   ArticlePreviewView!
    
    // UITextView
    @IBOutlet weak var plantTextView:     UITextView!
    @IBOutlet weak var animalTextView:    UITextView!
    @IBOutlet weak var microbeTextView:   UITextView!
    @IBOutlet weak var humanTextView:     UITextView!
    @IBOutlet weak var virusTextView:     UITextView!
    @IBOutlet weak var archaeaTextView:   UITextView!
    @IBOutlet weak var fungusTextView:    UITextView!
    @IBOutlet weak var chromistaTextView: UITextView!
    
    // Labels
    @IBOutlet weak var newLabel: NewLabel!
    
    @IBOutlet weak var plantsLabel:    ArticlesMenuLabel!
    @IBOutlet weak var animalsLabel:   ArticlesMenuLabel!
    @IBOutlet weak var microbesLabel:  ArticlesMenuLabel!
    @IBOutlet weak var humanLabel:     ArticlesMenuLabel!
    @IBOutlet weak var virusesLabel:   ArticlesMenuLabel!
    @IBOutlet weak var archaeaLabel:   ArticlesMenuLabel!
    @IBOutlet weak var fungusesLabel:  ArticlesMenuLabel!
    @IBOutlet weak var chromistaLabel: ArticlesMenuLabel!
    
    // UIScrollView
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var videoPlayerVCShowerButtonBackView:   ChromistaActionButtonsBack!
    @IBOutlet weak var readingOnTimeVCShowerButtonBackView: ChromistaActionButtonsBack!
    
    @IBAction func plantsVSshowing(_ sender: UIButton) {
        if #available(iOS 13.0, *) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let obj = storyboard.instantiateViewController(withIdentifier: "ViewControllerIdentifier") as! PlantsViewController
             present(obj, animated: true, completion: nil)
        }
    }
}

