//
//  ArticleViewControllerSetupViewPrtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 06.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol ArticleViewControllerSetupViewPrtocol {
    func procesingInformationShowing()
    func viewDidApearAnimationPreview(_ views: [UIView],_ bonusAnomation: (() -> Void)?)
}

protocol ArticlesVCconnectionProtocol {
    func notificationNamePost()
}
