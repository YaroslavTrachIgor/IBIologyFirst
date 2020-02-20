//
//  UIStroyboardExtension.swift
//  GoodBiology
//
//  Created by Denys Volkov on 2020-02-18.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class func controller(by storyBoardId: String,
                          controllerID: String) -> UIViewController? {
        let storyBoard = UIStoryboard(name: storyBoardId, bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: controllerID)
    }
}
