//
//  InstrumentsListVM_Test.swift
//  Stock3Tests
//
//  Created by Dinh, Le Khanh Duy on 17.11.22.
//

import XCTest
@testable import Stock3

final class InstrumentsListVM_Test: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadInstruments_IsLoading() async {
        let instrument = Instrument(id: 0,
                                    name: "Test",
                                    quotations: [
                                        Quotation(exchange: Exchange(id: 0, abbreviation: "ABB"),
                                                  quote: Quote(value: 123.123))
                                    ])
        let repository = MockRepository(instruments: [instrument])
        let useCase = DefaultFetchInstrumentsUseCase(instrumentsRepository: repository)
        let viewModel = InstrumentsListVM(fetchInstrumentsUseCase: useCase)
        viewModel.isLoading = true

        // Act
        let result = await viewModel.loadInstruments()

        // Assert
        XCTAssertTrue(result.isEmpty)
    }

    func testLoadInstruments_IsNotLoading() async {
        let instrument = Instrument(id: 0,
                                    name: "Test",
                                    quotations: [
                                        Quotation(exchange: Exchange(id: 0, abbreviation: "ABB"),
                                                  quote: Quote(value: 123.123))
                                    ])
        let exptectedResult = [InstrumentsListItemVM(instrument: instrument)]
        let repository = MockRepository(instruments: [instrument])
        let useCase = DefaultFetchInstrumentsUseCase(instrumentsRepository: repository)
        let viewModel = InstrumentsListVM(fetchInstrumentsUseCase: useCase)
        viewModel.isLoading = false

        // Act
        let result = await viewModel.loadInstruments()

        // Assert
        XCTAssertEqual(result[0].name, exptectedResult[0].name)
        XCTAssertEqual(result[0].exchange, exptectedResult[0].exchange)
        XCTAssertEqual(result[0].quote, exptectedResult[0].quote)
    }

    func testLoadInstruments() {
        // Arrange
//        let viewModel = InstrumentsListVM
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
