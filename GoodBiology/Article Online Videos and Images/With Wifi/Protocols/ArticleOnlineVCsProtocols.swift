//
//  ArticleOnlineVCsProtocols.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 27.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation

//MARK: - ArticleOnlineImagesViewControllerContentSetupProtocol protocol
protocol ArticleOnlineImagesViewControllerContentSetupProtocol {
    func urlGiven()
}



//MARK: - ArticleOnlineVCsSetupProtocol protocol
protocol ArticleOnlineVCsSetupProtocol: ArticleOnlineImagesViewControllerContentSetupProtocol {
    func viewDidApearAnimationSetup()
}
