//
//  InstrumentsListVM.swift
//  Stock3TestApp
//
//  Created by Dinh, Le Khanh Duy on 15.11.22.
//

import Foundation
import Combine

class InstrumentsListVM: ObservableObject {
    @Published var instruments: [InstrumentsListItemVM] = []
    @Published var isLoading = false

    var page = 1

    let fetchInstrumentsUseCase: FetchInstrumentsUseCase

    init(fetchInstrumentsUseCase: FetchInstrumentsUseCase) {
        self.fetchInstrumentsUseCase = fetchInstrumentsUseCase
    }

    func loadInstruments(page: Int = 1) async -> [InstrumentsListItemVM] {
        guard !isLoading else {
            return []
        }

        return await fetchInstruments(page: page)
    }

    private func fetchInstruments(page: Int) async -> [InstrumentsListItemVM] {
        DispatchQueue.main.sync { [weak self] in
            self?.isLoading = true
        }
        print("Starting to fetch instruments.")
        let result = await fetchInstrumentsUseCase.fetchInstruments(page: page)
        switch result {
        case .success(let fetchedInstruments):
            print("Finished fetching instruments.")
            DispatchQueue.main.sync { [weak self] in
                self?.isLoading = false
            }
            return fetchedInstruments.map { InstrumentsListItemVM(instrument: $0) }
        case .failure(let error):
            print(error.message)
            return []
        }
    }
}
