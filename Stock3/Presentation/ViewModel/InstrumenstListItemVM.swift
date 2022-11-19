//
//  InstrumentVM.swift
//  Stock3TestApp
//
//  Created by Dinh, Le Khanh Duy on 15.11.22.
//

import Foundation

struct InstrumentsListItemVM: Identifiable, Equatable {
    var id: UUID
    let name: String
    let exchange: String
    let quote: String
}

extension InstrumentsListItemVM {
    init(instrument: Instrument) {
        self.id = UUID()
        self.name = instrument.name
        self.exchange = instrument.quotations.first?.exchange.abbreviation ?? ""
        self.quote = String(format: "%.3f", instrument.quotations.first?.quote.value ?? 0)
    }
}
