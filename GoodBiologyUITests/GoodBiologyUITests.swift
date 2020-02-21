//
//  GoodBiologyUITests.swift
//  GoodBiologyUITests
//
//  Created by Yaroslav on 11/10/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import XCTest

class GoodBiologyUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        
    }

    func test() {
        /// Application
        let app = XCUIApplication()
        
        /// Main Menu Buttons ( ArticlesVC )
        let plantsTestButton = app.scrollViews.otherElements.containing(.staticText, identifier:" Plants Article").children(matching: .button).element
        let animalsTestButton = app.scrollViews.otherElements.containing(.staticText, identifier:" Animals Article").children(matching: .button).element
        
        XCTAssertEqual(plantsTestButton.exists, animalsTestButton.exists)
        
        XCTAssertTrue(animalsTestButton.exists, "Buttons that push Controller to articless(Plants, Animals)")
        XCTAssertTrue(animalsTestButton.exists)
        
        /// Main Menu BarButtonItems ( ArticlesVC )
        let browserBarButtonItem  = app.navigationBars["Articles"].children(matching: .button).matching(identifier: "Item").element(boundBy: 0)
        let contactBarButtonItem  = app.navigationBars["Articles"].buttons["Email"]
        let aboutAppBarButtonItem = app.navigationBars["Articles"].children(matching: .button).matching(identifier: "Item").element(boundBy: 1)
        
        XCTAssertTrue(browserBarButtonItem.exists)
        XCTAssertTrue(contactBarButtonItem.exists)
        XCTAssertTrue(aboutAppBarButtonItem.exists)
        
        plantsTestButton.tap()
        
        /// Artcicle NotificationButton
        let notificationButton = app.buttons["Notification was put"]
        
        /// Article NavBar
        let plantsNavigationBar = app.navigationBars["Plants"]
        
        /// Article NavBar BarButtonItems
        let searchBarButtonItem = plantsNavigationBar.buttons["Search"]
        let hideBarButtonItem   = plantsNavigationBar.buttons["eye.slash"]
        let sizeBarButtonItem   = plantsNavigationBar.buttons["textformat.size"]
        
        XCTAssertEqual(plantsTestButton.exists, animalsTestButton.exists)
        XCTAssertTrue(animalsTestButton.exists)
    }
}
