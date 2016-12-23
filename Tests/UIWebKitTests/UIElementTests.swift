import XCTest
@testable import UIWebKit

class UIElementTests: XCTestCase {
    static let allTests = [
        ("Test Element Start", testElementStart),
        ("Test Element End", testElementEnd),
        ("Test Element Attributes", testAttributes),
        ("Test Element Text", testText),
        ("Test Element Children", testChildren),
        ("Test Element Parse", testParse)
    ]
    
    func testElementStart() {
        let element = UIElement(element: .p)
        XCTAssert(element.start == "<p>")
    }
    
    func testElementEnd() {
        let element = UIElement(element: .a)
        XCTAssert(element.end == "</a>")
    }
    
    func testAttributes() {
        let element = UIElement(element: .div)
        element.attributes["style"] = "color: orange;"
        XCTAssert(element.attributes["style"] == "color: orange;")
    }
    
    func testText() {
        let element = UIElement(element: .p)
        element.text = "Hello World"
        XCTAssert(element.text == "Hello World")
    }
    
    func testChildren() {
        let element = UIElement(element: .div)
        let child = UIElement(element: .p)
        element.children.append(child)
        XCTAssert(element.children[0] == child)
    }
    
    func testParse() {
        let element = UIElement(element: .div)
        element.attributes["style"] = "color: orange;"
        let child = UIElement(element: .p)
        element.children.append(child)
        
        let html = element.parse()
        
        XCTAssert(html == "<div style='color: orange;' ><p></p></div>")
    }
}
