//
//  InstrumentCell.swift
//  Stock3TestApp
//
//  Created by Dinh, Le Khanh Duy on 15.11.22.
//

import SwiftUI

struct InstrumentCell: View {
    let instrument: String
    let exchange: String
    let quote: String

    var body: some View {
        VStack {
            HStack {
                Text(instrument)
                    .bold()
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 3, trailing: 10))
            HStack {
                Text(exchange)
                    .foregroundColor(Color("1886FA"))
                    .lineLimit(1)
                Spacer()
                Text(quote)
                    .multilineTextAlignment(.trailing)
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 10))
            Divider()
                .background(Color.gray)
        }
    }
}


struct InstrumentCell_Previews: PreviewProvider {
    static var previews: some View {
        InstrumentCell(instrument: "Xtrackers LevDAX", exchange: "LUS", quote: "123.123")
    }
}
