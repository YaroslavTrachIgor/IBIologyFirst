//
//  TestLandingPresenter.swift
//  GoodBiology
//
//  Created by Denys Volkov on 2020-02-08.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation

protocol TestLandingPresenterDelegate: class {
    func presenterDidSelectTest(_ presenter: TestLandingPresenterProtocol, test: Test)
}

protocol TestLandingPresenterProtocol {
    func onViewDidLoad()
    func onTestDidTap(with index: Int)
}

class TestLandingPresenter {
    private weak var delegate: TestLandingPresenterDelegate?
    private weak var controller: TestLandingControllerProtocol?
    
    private var tests: [Test]
    
    init(delegate: TestLandingPresenterDelegate,
         controller: TestLandingControllerProtocol,
         tests: [Test]) {
        self.delegate = delegate
        self.controller = controller
        self.tests = tests
    }
}

extension TestLandingPresenter: TestLandingPresenterProtocol {
    func onViewDidLoad() {}
    
    func onTestDidTap(with index: Int) {
        delegate?.presenterDidSelectTest(self, test: tests[index])
    }
}
