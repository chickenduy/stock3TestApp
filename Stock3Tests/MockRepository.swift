//
//  MockRepository.swift
//  Stock3Tests
//
//  Created by Dinh, Le Khanh Duy on 17.11.22.
//

import Foundation
@testable import Stock3

class MockRepository: Repository {
    var instruments: [Instrument] = []
    var error: RequestError? = nil

    init(instruments: [Instrument]) {
        self.instruments = instruments
    }

    init(error: RequestError) {
        self.error = error
    }


    func loadData() async -> ApiResult<[Instrument]> {
        if let requestError = error {
            return .failure(requestError)
        }

        return .success([
            Instrument(id: 0,
                       name: "Test",
                       quotations: [
                        Quotation(exchange: Exchange(id: 0, abbreviation: "ABB"),
                                  quote: Quote(value: 123.123))
                       ])
        ])
    }
}
