//
//  ImagesViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/8/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

class ImagesViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var plantsImage: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    @IBAction func showPlantsImage(_ sender: Any) {
        
        imagePicker.allowsEditing = true
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if ((info[UIImagePickerController.InfoKey.originalImage] as? UIImage) != nil) {
            
            plantsImage.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
}
