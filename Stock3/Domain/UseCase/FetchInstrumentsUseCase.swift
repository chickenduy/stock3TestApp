//
//  FetchInstrumentsUseCase.swift
//  Stock3
//
//  Created by Dinh, Le Khanh Duy on 17.11.22.
//

import Foundation

protocol FetchInstrumentsUseCase {
    func fetchInstruments(page: Int) async -> ApiResult<[Instrument]>
}

class DefaultFetchInstrumentsUseCase: FetchInstrumentsUseCase {
    private let instrumentsRepository: Repository

    init(instrumentsRepository: Repository) {
        self.instrumentsRepository = instrumentsRepository
    }

    func fetchInstruments(page: Int) async -> ApiResult<[Instrument]> {
        return await instrumentsRepository.fetchInstruments(page: page)
    }
}
