import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(onetricks_iosTests.allTests),
    ]
}
#endif