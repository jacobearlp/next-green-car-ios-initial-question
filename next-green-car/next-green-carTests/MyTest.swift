//
//  MyTest.swift
//  next-green-carTests
//
//  Created by Jacob on 3/7/23.
//

import XCTest
@testable import next_green_car

class MyTest: XCTestCase {

    func testFunctionToTestSuccessful() {
        let mockApi = MockAPI()
        let classToTest = ClassToTest(api: mockApi)

        // Input
        classToTest.functionToTest()

        // Output
        let expected = "Success"

        // Assertion
        XCTAssertEqual(classToTest.stateList.last, expected)
    }

    func testFunctionToTestFailing() {
        let mockApi = MockAPI(failingTest: true)
        let classToTest = ClassToTest(api: mockApi)

        // Input
        classToTest.functionToTest()

        // Output
        let expected = "Failed"

        // Assertion
        XCTAssertEqual(classToTest.stateList.last, expected)
    }
}
