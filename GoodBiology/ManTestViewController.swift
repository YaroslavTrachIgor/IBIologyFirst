//
//  ManTestViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 11/17/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

class ManTestViewController: UIViewController {

    @IBAction func Done(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Good", message: "Thanks for passing our Plants Test", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        {
            (action) in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        
        let theButton = sender as! UIButton
        
        let bounds = theButton.bounds
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            theButton.bounds = CGRect(x: bounds.origin.x - 10, y: bounds.origin.y , width: bounds.size.width + 60, height: bounds.size.height)
        }) { (success:Bool) in
            if success
            {
                UIView.animate(withDuration: 0.5, animations:
                    {
                        theButton.bounds = bounds
                })
            }
        }
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
