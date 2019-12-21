//
//  PhotoViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12/28/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet fileprivate var plantsImage: UIImageView!
    
    @IBAction func plantsPhoto(_ sender: UIButton) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true)
        {
            //After it is complete
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [bool : Any])
    {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            plantsImage.image = image
        }
        else
        {
            //Error message
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
