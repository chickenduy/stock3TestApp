//
//  Instrument.swift
//  Stock3TestApp
//
//  Created by Dinh, Le Khanh Duy on 15.11.22.
//

import Foundation

struct Response: Codable {
    private enum CodingKeys: String, CodingKey {
        case data
    }
    var meta: Any?
    var cursor: Any?
    var error: Any?
    var data: [Instrument]
}

struct Instrument: Codable, Equatable {
    var id: Int
    var name: String
    var quotations: [Quotation]

    static func == (lhs: Instrument, rhs: Instrument) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.quotations == rhs.quotations
    }
}

struct Quotation: Codable, Equatable {
    var exchange: Exchange
    var quote: Quote

    static func == (lhs: Quotation, rhs: Quotation) -> Bool {
        return lhs.exchange == rhs.exchange && lhs.quote == rhs.quote
    }

}

struct Exchange: Codable, Equatable {
    var id: Int
    var abbreviation: String
}

struct Quote: Codable, Equatable {
    var value: Float
}
