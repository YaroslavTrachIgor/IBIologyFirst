//
//  BasicsCoordinator.swift
//  GoodBiology
//
//  Created by tng on 12/17/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
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
        
        guard let firstBasicVeiwController = viewControllers.first as? BiologyViewController else {
            fatalError("Fatal Error")
        }
        firstBasicVeiwController.configure(with: dataManager.basicModel(with: 0), nextAction: { [unowned self] in
            self.showNextBasicViewСontroller()
        })
    }
    
    //MARK: Public
    @available(iOS 13.0, *)
    public func showNextBasicViewСontroller() {
        let currentElementsAmount = viewControllers.count
        let maxElements = dataManager.numberOfModels()
        
        if maxElements == currentElementsAmount { return }
        
        let basicModel = dataManager.basicModel(with: currentElementsAmount)
        let sb         = UIStoryboard(name: kStoryBoardName, bundle: nil)
        
        guard let vc = sb.instantiateViewController(withIdentifier: kBasicViewControllerName) as? BiologyViewController else { return }
        
        let isLast     = currentElementsAmount == (maxElements - 1)
        let nextAction = isLast == true ? nil : { [unowned self] in
            self.showNextBasicViewСontroller()
        }
             vc.configure(with: basicModel, nextAction: nextAction)
        show(vc, sender: self)
    }
}

extension BiologyViewController {
    
    //MARK: - Public
    func configure(with basicsModel: BasicsModel, nextAction: NextAction?) {
        contentModel = basicsModel
        
        guard let nextClosure = nextAction else {
            self.navigationItem.rightBarButtonItem = nil
            return
        }
        showNext = nextClosure
    }
    
    func removeNotifications(withIdentifiers identifiers: [String]) {
        removeNotification(identifiers: identifiers)
    }
}
