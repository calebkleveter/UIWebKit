#if os(Linux)

    import XCTest
    @testable import UIWebKit
    
    XCTMain([
        testCase(UIElementTests.allTests)
    ])
    
#endif
