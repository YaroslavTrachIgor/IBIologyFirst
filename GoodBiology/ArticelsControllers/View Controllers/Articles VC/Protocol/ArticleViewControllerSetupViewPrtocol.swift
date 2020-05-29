//
//  ArticleViewControllerSetupViewPrtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 06.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - ArticleViewControllerSetupViewPrtocol
protocol ArticleViewControllerSetupViewPrtocol {
    func procesingInformationShowing()
    func viewDidApearAnimationPreview(_ views: [UIView],_ bonusAnomation: (() -> Void)?)
}


//MARK: - ArticlesVCconnectionProtocol
protocol ArticlesVCconnectionProtocol {
    func notificationNamePost()
}
