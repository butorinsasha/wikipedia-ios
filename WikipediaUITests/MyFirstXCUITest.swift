//~~~**DELETE THIS HEADER**~~~

import XCTest

final class MyFirstXCUITest: XCTestCase {

    let app = XCUIApplication(bundleIdentifier: "org.wikimedia.wikipedia")
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        
//        let firstButton = app.buttons.firstMatch
//        firstButton.waitForExistence(timeout: 2)
//        firstButton.tap()
        
//        let myLabel = app.staticTexts["Featured article"]
//        myLabel.wait()
//        myLabel.tap()
        
        let myLabel = app.staticTexts["2024 Indian general election"]
        while !(myLabel.isHittable) {
            app.swipeUp()
        }
        myLabel.tap()
        let contentButton = app.buttons["Table of contents"]
        contentButton.tap()
        let contentHeader = app.otherElements["CONTENTS"]
        XCTAssert(contentHeader.exists)
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testUiTestRecorderForWebViewOpen() {
        let app = XCUIApplication()
        app.toolbars["Toolbar"].buttons["Settings"].tap()
        app.tables.staticTexts["Donate"].tap()
        let webView = XCUIApplication().webViews.firstMatch
        XCTAssertTrue(webView.exists, "WebView is not present")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

extension XCUIElement {
    @discardableResult
    func wait(_ timeout: TimeInterval = 10) -> Self {
        XCTAssertTrue(self.waitForExistence(timeout: timeout), "Element does not exist")
        return self
    }
}
