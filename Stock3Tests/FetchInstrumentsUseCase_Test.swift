//
//  FetchInstrumentsUseCase_Test.swift
//  Stock3Tests
//
//  Created by Dinh, Le Khanh Duy on 17.11.22.
//

import XCTest
@testable import Stock3

final class FetchInstrumentsUseCase_Test: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadData_Success() async {
        // Arrange
        let instruments = [
            Instrument(id: 0,
                       name: "Test",
                       quotations: [
                        Quotation(exchange: Exchange(id: 0, abbreviation: "ABB"),
                                  quote: Quote(value: 123.123))
                       ])
        ]
        let repository = MockRepository(instruments: instruments)
        let useCase = DefaultFetchInstrumentsUseCase(instrumentsRepository: repository)

        // Act
        let result = await useCase.fetchInstruments()

        // Assert
        switch result {
        case .success(let returnedInstruments):
            XCTAssertEqual(returnedInstruments, instruments)
        case .failure(_):
            XCTFail()
        }

    }

    func testLoadData_Fail() async {
        // Arrange
        let error = RequestError(message: "")
        let repository = MockRepository(error: error)
        let useCase = DefaultFetchInstrumentsUseCase(instrumentsRepository: repository)

        // Act
        let result = await useCase.fetchInstruments()

        // Assert
        switch result {
        case .success(_):
            XCTFail()
        case .failure(let returnedError):
            XCTAssertNotNil(returnedError)
        }

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
