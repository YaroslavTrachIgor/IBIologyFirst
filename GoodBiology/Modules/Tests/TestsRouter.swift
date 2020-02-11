//
//  TestsRouter.swift
//  GoodBiology
//
//  Created by Denys Volkov on 2020-02-08.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol TestsRouterProtocol {
    func showTestsLanding(navigationController: UINavigationController)
}

class TestsRouter {
    var navigationContoller: UINavigationController?
}

extension TestsRouter: TestsRouterProtocol {
    func showTestsLanding(navigationController: UINavigationController) {
        let controller = TestLandingController(loadType: .xib)
        
        let _ = TestLandingPresenter(delegate: self,
                                     controller: controller,
                                     tests: [])
        navigationController.show(controller, sender: self)
    }
}

extension TestsRouter: TestLandingPresenterDelegate {
    func presenterDidSelectTest(_ presenter: TestLandingPresenterProtocol, test: Test) {
        //show quiz screen
    }
}
