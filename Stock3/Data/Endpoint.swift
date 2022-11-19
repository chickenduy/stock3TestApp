//
//  Endpoint.swift
//  Stock3
//
//  Created by Dinh, Le Khanh Duy on 18.11.22.
//

import Foundation

struct Endpoint {
    func getInstruments(page: Int) -> URL? {
        return  URL(string: "https://api.boerse-go.de/instrument/?client_id=grid&locale=de&limit=20&page=\(page)&filter=country.id=23%20AND%20assetClass.id=2&select=name,quotations[exchange[abbreviation],quote[value]]")
    }

}
