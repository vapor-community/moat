import XCTest

import MoatTests

var tests = [XCTestCaseEntry]()
tests += MoatTests.allTests()
XCTMain(tests)