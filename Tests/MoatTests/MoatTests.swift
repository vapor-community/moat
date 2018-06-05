import XCTest
@testable import Moat

final class MoatTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Moat().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
