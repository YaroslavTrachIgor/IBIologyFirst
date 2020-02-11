//
//  TestLandingController.swift
//  GoodBiology
//
//  Created by Denys Volkov on 2020-02-08.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol TestLandingControllerProtocol: class {
    var presenter: TestLandingPresenterProtocol? { get set }
    func show(rows: [TestLandingRow])
}

class TestLandingController: BaseViewController {
    var presenter: TestLandingPresenterProtocol?
    var rows: [TestLandingRow] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
        prepareTableView()
    }
    /// implemented for test screen with mocked data
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        show(rows: mockedArray())
    }
}

extension TestLandingController:  TestLandingControllerProtocol {
    func show(rows: [TestLandingRow]) {
        self.rows = rows
        tableView.reloadData()
    }
}

private extension TestLandingController {
    func prepareTableView() {
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.register(cellClass: TestLandingCell.self)
    }
}

extension TestLandingController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellClass: TestLandingCell.self)
        cell.set(data: rows[indexPath.row])
        
        return cell
    }
}

extension TestLandingController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        presenter?.onTestDidTap(with: indexPath.row)
    }
}

extension TestLandingController {
    func mockedArray() -> [TestLandingRow] {
        return [
            TestLandingRow(title: "Test 1",
                           description: "Some test description number one",
                           isPassed: false),
            TestLandingRow(title: "Test 2",
            description: "Some test description number two",
            isPassed: false),
            TestLandingRow(title: "Test 3",
            description: "Some test description number three",
            isPassed: false),
            TestLandingRow(title: "Long text testing for checking autoresize of text elements, should be resized",
            description: "Some  long long long long long long long long long long long long long long long long long long long long long long long long long test description number four",
            isPassed: false)
        ]
    }
}
