//
//  InstrumentsListView.swift
//  Stock3TestApp
//
//  Created by Dinh, Le Khanh Duy on 15.11.22.
//

import SwiftUI


struct InstrumentsListView: View {
    @ObservedObject var viewModel: InstrumentsListVM = InstrumentsListVM(fetchInstrumentsUseCase: DefaultFetchInstrumentsUseCase(instrumentsRepository: InstrumentRepository()))

    var body: some View {
        NavigationView {
            List(viewModel.instruments) { instrument in
                InstrumentCell(instrument: instrument.name, exchange: instrument.exchange, quote: instrument.quote)
//                    .background(NavigationLink("", destination: EmptyView()).opacity(0).background(Color.clear))
                    .background(Color.white)
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color("E5E5E5"))
                    .listRowSeparator(.hidden)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                    .task {
                        await viewModel.loadMoreInstrumentsIfNeeded(currentInstrument: instrument)
                    }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .task {
                await viewModel.loadInstruments(page: viewModel.page)
            }
            .navigationTitle("Stock3")
            if viewModel.isLoading {
                ProgressView()
            }
        }
    }
}

struct InstrumentsListView_Previews: PreviewProvider {
    static var previews: some View {
        InstrumentsListView()
    }
}
