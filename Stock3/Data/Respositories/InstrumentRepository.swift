//
//  InstrumentRepository.swift
//  Stock3
//
//  Created by Dinh, Le Khanh Duy on 17.11.22.
//

import Foundation

typealias ApiResult<T> = Result<T, RequestError>

struct RequestError: Error {
    let message: String
}

protocol Repository {
    func fetchInstruments(page: Int) async -> ApiResult<[Instrument]>
}

class InstrumentRepository: Repository {
    func fetchInstruments(page: Int) async -> ApiResult<[Instrument]>{
        guard let url = Endpoint().getInstruments(page: page) else {
            return .failure(RequestError(message: "Invalid URL") )
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let response = response as? HTTPURLResponse else {
                return .failure(RequestError(message: "Couldn't parse HTTP Response"))
            }

            if response.statusCode == 200 {
                do {
                    let result = try JSONDecoder().decode(Response.self, from: data)
                    return .success(result.data)
                } catch let error {
                    return .failure(RequestError(message: "Error decoding: \(error)"))
                }
            }
            return .failure(RequestError(message: "Error code not 200"))
        } catch let error {
            return .failure(RequestError(message: "Error fetching: \(error)"))
        }
    }
}
