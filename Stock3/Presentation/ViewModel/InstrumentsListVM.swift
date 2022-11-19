//
//  InstrumentsListVM.swift
//  Stock3TestApp
//
//  Created by Dinh, Le Khanh Duy on 15.11.22.
//

import Foundation
import Combine

class InstrumentsListVM: ObservableObject {
    @Published private(set) var instruments: [InstrumentsListItemVM] = []
    @Published var isLoading = false

    var page = 1

    let fetchInstrumentsUseCase: FetchInstrumentsUseCase

    init(fetchInstrumentsUseCase: FetchInstrumentsUseCase) {
        self.fetchInstrumentsUseCase = fetchInstrumentsUseCase
    }

    func loadInstruments(page: Int = 1) async {
        return await fetchInstruments(page: page)
    }

    func loadMoreInstrumentsIfNeeded(currentInstrument: InstrumentsListItemVM?) async {
        if !isLoading {
            return
        }


        guard let item = currentInstrument else {
            page += 1
            await fetchInstruments(page: page)
            return
        }

        let thresholdIndex = instruments.index(instruments.endIndex, offsetBy: -5)
        if instruments.firstIndex(where: { $0.id == item.id }) == thresholdIndex {
            page += 1
            await fetchInstruments(page: page)
        }
    }

    private func fetchInstruments(page: Int) async {
        DispatchQueue.main.async { [weak self] in
            self?.isLoading = true
        }
        let result = await fetchInstrumentsUseCase.fetchInstruments(page: page)
        switch result {
        case .success(let fetchedInstruments):
            DispatchQueue.main.async { [weak self] in
                self?.instruments.append(contentsOf: fetchedInstruments.map { InstrumentsListItemVM(instrument: $0) })
                self?.isLoading = false
            }
        case .failure(let error):
            print(error.message)
        }
    }
}
