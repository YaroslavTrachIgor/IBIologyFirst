//
//  MakePhotos.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/4/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

class MakePhotos: UITableView, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBAction func MakePhotoesButton(_ sender: Any) {
        
        let image = UIImagePickerController()
        
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        
        self.present(image, animated: true) {
            
            
        }
    }
    
    @IBOutlet weak var ImageView: UIImageView!
    
}
