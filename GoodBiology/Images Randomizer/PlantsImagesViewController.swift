//
//  ImagesViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 3/23/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

class PlantsImagesViewController: UIViewController {

    @IBOutlet fileprivate var imageView:            UIImageView!
    @IBOutlet fileprivate var imageViewBackground:  UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewPrefering()
        downloadImage()
    }
    
    func downloadImage() {
        
        let images = ["https://suttons.s3.amazonaws.com/p/FLSAMA23381_3.jpg", "https://www.hedgesdirect.co.uk/acatalog/English-Yew-(Taxus-Baccata)-Leaf-Close-Up.jpg", "https://i.pinimg.com/originals/d2/e1/0e/d2e10e9466aad5cfcc6f49ed8b398cb0.jpg", "https://alfahir.hu/sites/default/files/kepek/2018_08/kave2.jpg", "https://i.pinimg.com/originals/c8/a7/43/c8a7439b1dd5f362ea8b22f753414bd8.jpg", "https://media.idownloadblog.com/wp-content/uploads/2017/09/Flower_HELLEBORUS-iOS-11-GM-iPhone-wallpapers.jpg", "http://media.idownloadblog.com/wp-content/uploads/2017/09/Flower_AECHMEA-iOS-11-GM-iPad-wallpapers.jpg"]
        let url = URL(string: images.randomElement()!)
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async() {    // execute on main thread
                self.imageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.6) {
            self.imageView.alpha = 1
        }
    }
    
    private func viewPrefering() {
        imageViewBackground.viewShadows()
        
        imageViewBackground.layer.cornerRadius = 20
        imageView.layer.cornerRadius           = 20
    }
    
    @IBAction func refreshImage(_ sender: Any) {
        let images = ["https://i.pinimg.com/originals/c8/a7/43/c8a7439b1dd5f362ea8b22f753414bd8.jpg", "https://media.idownloadblog.com/wp-content/uploads/2017/09/Flower_HELLEBORUS-iOS-11-GM-iPhone-wallpapers.jpg", "http://media.idownloadblog.com/wp-content/uploads/2017/09/Flower_AECHMEA-iOS-11-GM-iPad-wallpapers.jpg"]
        
        let url = URL(string: images.randomElement()!)
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async() {    // execute on main thread
                self.imageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }
}
