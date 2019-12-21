//
//  AboutArticelsViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 11/14/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

class AboutArticelsViewController: UIViewController {
    
    
    @IBOutlet weak var Text: UITextView!
    
    
    let InThis : String = "In this article you can read something about "
    
    @IBAction func AboutArticelsButton(_ sender: UIButton) {
        Text.text = InThis + "Basics, Defenition, Evolution, Fossils, Embryophytes and Diversity of Plants"
    }
    
    @IBAction func Animals(_ sender: Any) {
        Text.text = InThis + "Basics, Etymology, Ecology, Phylogeny and Evolutionary origin of Animals"
    }
    
    @IBAction func Mushrooms(_ sender: Any) {
        Text.text = InThis + "Basics, Identification, Classification, Etymology and Microscopic of Mushrooms"
    }
    
    @IBAction func Micobes(_ sender: Any) {
        Text.text = InThis + "Basics, History and discovery, Classification, Evolution, Bacteria and Archaea origin of Microbes"
    }
    
    @IBAction func Virus(_ sender: Any) {
        Text.text = InThis + "Basics, Life properties, Etymology and Origins of Virus"
    }
    
    @IBAction func Cancel(_ sender: Any) {
        Text.text = " "
    }
    
    @IBAction func Man(_ sender: Any) {
        Text.text = InThis + "Basics, Intraspecific polymorphism, Origin, The concept of the essence and History of Man"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
