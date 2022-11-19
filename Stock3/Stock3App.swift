//
//  Stock3App.swift
//  Stock3
//
//  Created by Dinh, Le Khanh Duy on 15.11.22.
//

import SwiftUI

@main
struct Stock3App: App {
    var body: some Scene {
        WindowGroup {
            InstrumentsListView(viewModel: InstrumentsListVM(fetchInstrumentsUseCase: DefaultFetchInstrumentsUseCase(instrumentsRepository: InstrumentRepository())))
        }
    }
}
