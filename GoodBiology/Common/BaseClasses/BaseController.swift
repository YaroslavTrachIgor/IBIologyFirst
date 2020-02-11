//
//  BaseController.swift
//  GoodBiology
//
//  Created by Denys Volkov on 2020-02-11.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

open class BaseViewController: UIViewController {

    public enum LoadType {
        case programmatically
        case xib
        case xibWith(suffix: String)
    }

    override public var prefersStatusBarHidden: Bool {
        return false
    }

    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Life cycle
    // Pass Bundle.mtCommon to "bundle" in order to load xib files located inside framework
    public init(loadType: LoadType = .xib, bundle: Bundle = .main) {
        var nibName: String

        switch loadType {
        case .programmatically:
            super.init(nibName: nil, bundle: bundle)
            return
        case .xib:
            nibName = type(of: self).className
        case let .xibWith(suffix):
            nibName = type(of: self).className + suffix
        }

        super.init(nibName: nibName, bundle: bundle)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
