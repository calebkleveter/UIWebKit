import XCTest
@testable import UIWebKit

class UIElementTests: XCTestCase {
    static let allTests = []
    
    func testElementStart() {
        let element = UIElement(element: .p)
        XCTAssert(element.start == "<p>")
    }
    
    func testElementEnd() {
        let element = UIElement(element: .a)
        XCTAssert(element.end == "</a>")
    }
}
