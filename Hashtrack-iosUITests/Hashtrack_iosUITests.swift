//
//  Hashtrack_iosUITests.swift
//  Hashtrack-iosUITests
//
//  Created by Joe Birch on 11/11/2018.
//  Copyright © 2018 hitherejoe. All rights reserved.
//

import XCTest

class Hashtrack_iosUITests: XCTestCase {
let app = XCUIApplication()
    override func setUp() {
        continueAfterFailure = true
        app.launch()
    }

    func twitterNetworkTextIsDisplayed() {
        XCTAssertEqual("Content screen for twitter", app.textViews["networkLabel"].value as? String)
    }
    
    func instagramNetworkTextIsDisplayedAfterNavigatingFromTwitterTab() {
        app.buttons["Instagram"].tap()
        XCTAssertEqual("Content screen for instagram", app.textViews["networkLabel"].value as? String)
    }
    
    func twitterNetworkTextIsDisplayedAfterNavigatingFromInstagramTab() {
        app.buttons["Instagram"].tap()
        app.buttons["Twitter"].tap()
        XCTAssertEqual("Content screen for twitter", app.textViews["networkLabel"].value as? String)
    }

}
