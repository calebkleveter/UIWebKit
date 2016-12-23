import XCTest
import Vapor
@testable import UIWebKit

class UIWebPageTests: XCTestCase {
    static let allTests = [
        ("Tests Page Elements", testElements)
    ]
    
    func testElements() {
        let head = UIElement(element: .head)
        let header = UIElement(element: .header)
        let section = UIElement(element: .section)
        let footer = UIElement(element: .footer)
        let page = UIWebPage(head: head, header: header, section: section, footer: footer)
        
        XCTAssert(page.head == head)
        XCTAssert(page.header == header)
        XCTAssert(page.section == section)
        XCTAssert(page.footer == footer)
    }
}

func AssertThrows<T, U>(_ function: (T)throws -> U) {
    do {
        try function
        XCTFail()
    } catch {
        XCTAssertEqual(1, 1)
    }
}

func AssertNotThrows<T, U>(_ function: (T)throws -> U) {
    do {
        try function
        XCTAssertEqual(1, 1)
    } catch {
        XCTFail()
    }
}
