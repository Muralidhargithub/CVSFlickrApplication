//
//  CVSFlickrApplicationUITests.swift
//  CVSFlickrApplicationUITests
//
//  Created by Muralidhar reddy Kakanuru on 2/11/25.
//

import XCTest

final class CVSFlickrApplicationUITests: XCTestCase {
    
    let application = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        application.launch()
    }
    
    @MainActor
    func testSearchField() {
        let searchField = application.searchFields.firstMatch
        XCTAssertTrue(searchField.exists, "saech b ar is exist")
        
        searchField.tap()
        searchField.typeText("lion")
        
        let fimage = application.images.firstMatch
        XCTAssertTrue(fimage.waitForExistence(timeout: 5), "Images should load after search")
        
    }
    
    func testTapOpendetailImage(){
        let fimage = application.images.firstMatch
        XCTAssertTrue(fimage.waitForExistence(timeout: 5), "wait")
        fimage.tap()
        let detailTitle = application.staticTexts.firstMatch
        XCTAssertTrue(detailTitle.waitForExistence(timeout: 5), "Detail screen")
    }
    

    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
