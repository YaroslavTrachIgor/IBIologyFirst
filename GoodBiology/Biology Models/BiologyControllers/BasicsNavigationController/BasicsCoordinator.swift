//
//  BasicsCoordinator.swift
//  GoodBiology
//
//  Created by tng on 12/17/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class BasicsNavigationController: UINavigationController {
    
    //MARK: Constants
    let kStoryBoardName          = "Biology"
    let kBasicViewControllerName = "BasicViewController"
    
    //MARK: Lazy properties
    fileprivate lazy var dataManager: BasicsDataManager = {
        let manager = BasicsDataManager()
            manager.prepareModels()
        
        return manager
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let firstBasicVeiwController = viewControllers.first as? BasicsViewController else {
            fatalError("Fatal Error")
        }
        firstBasicVeiwController.configure(with: dataManager.basicModel(with: 0), nextAction: { [unowned self] in
            self.showNextBasicViewСontroller()
        })
        
        if navigationItem.title == "Botany" {
            RateManager.showRatesController()
        }
    }
    
    //MARK: Public
    public func showNextBasicViewСontroller() {
        let currentElementsAmount = viewControllers.count
        let maxElements = dataManager.numberOfModels()
        
        if maxElements == currentElementsAmount { return }
        
        let basicModel = dataManager.basicModel(with: currentElementsAmount)
        let sb         = UIStoryboard(name: kStoryBoardName, bundle: nil)
        
        guard let vc = sb.instantiateViewController(withIdentifier: kBasicViewControllerName) as? BasicsViewController else { return }
        
        let isLast      = currentElementsAmount == (maxElements - 1)
        let nextAction  = isLast == true ? nil : { [unowned self] in
            self.showNextBasicViewСontroller()
        }
        
             vc.configure(with: basicModel, nextAction: nextAction)
        show(vc, sender: self)
        
        if navigationItem.title == "Botany" {
            RateManager.showRatesController()
        }
    }
}
