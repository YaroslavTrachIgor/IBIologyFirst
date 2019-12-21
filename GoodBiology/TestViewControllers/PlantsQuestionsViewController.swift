//
//  PlantsQuestionsViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 11/30/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

class PlantsQuestionsViewController: UIViewController {
    
    var timer = Timer()
    
    @IBOutlet weak var NumberOfQuestionLabel: UILabel!
    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var ProgressView: UIProgressView!
    
    func LabelsUpdating() {
        
        if (ProgressView.progress == 0.3) {
            
            NumberOfQuestionLabel.text = "1 Question"
            QuestionLabel.text = "1) What Are The Plants ?"
        } else if (ProgressView.progress == 0.5) {
            
            NumberOfQuestionLabel.text = "2 Question"
            QuestionLabel.text = "2) How Many Types Of Plants ?"
        } else if (ProgressView.progress == 0.8) {
            
            NumberOfQuestionLabel.text = "2 Question"
            QuestionLabel.text = "3) From What Plants Obtain Their Energy ?"
        } else if (ProgressView.progress == 1) {
            
            NumberOfQuestionLabel.text = "2 Question"
            QuestionLabel.text = "4) What Prosent ( % ) Of Flowering Plants ?"
        }
        
        func progressViewUpdating() {
            
            if (ProgressView.progress == 0.0) {
                
                ProgressView.progress = +0.3
            } else if (ProgressView.progress == +0.3) {
                
                ProgressView.progress = +0.2
            }  else if (ProgressView.progress == +0.5) {
                
                ProgressView.progress = +0.3
            } else if (ProgressView.progress == +0.8) {
                
                ProgressView.progress = +0.2
            }
        }
    }
    
    @IBAction func ActionProgressView(_ sender: Any) {
        
        LabelsUpdating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
