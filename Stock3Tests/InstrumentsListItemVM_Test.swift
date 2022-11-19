//
//  InstrumentsListItemVM_Test.swift
//  Stock3Tests
//
//  Created by Dinh, Le Khanh Duy on 17.11.22.
//

import XCTest
@testable import Stock3

final class InstrumentsListItemVM_Test: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInstrumentListItemVM_init() {
        // Arrange
        let testName = "Name"
        let testExchange = "Exchange"
        let testQuote: Float = 123.123
        let instrument = Instrument(id: 0, name: testName, quotations: [Quotation(exchange: Exchange(id: 0, abbreviation: testExchange), quote: Quote(value: testQuote))])

        // Act
        let viewModelItem = InstrumentsListItemVM(instrument: instrument)

        // Assert
        XCTAssertEqual(viewModelItem.name, testName)
        XCTAssertEqual(viewModelItem.exchange, testExchange)
        XCTAssertEqual(viewModelItem.quote, "\(testQuote)")
    }


    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
