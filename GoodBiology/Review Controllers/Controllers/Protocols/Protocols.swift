//
//  ReviewControllerProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 28.09.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation

protocol ReviewControllerProtcol {
    func basicViewProcessesPrefering()
}

protocol ReviewControllerViewSetupProtocol {
    func alphaSetup()
    func viewSetup()
    func systemBackSetup()
}

protocol ReviewVCMailComposeVCSetupProtocol {
    func showAndSetupMailComposer()
}
