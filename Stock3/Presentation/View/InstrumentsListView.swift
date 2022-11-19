//
//  InstrumentsListView.swift
//  Stock3TestApp
//
//  Created by Dinh, Le Khanh Duy on 15.11.22.
//

import SwiftUI


struct InstrumentsListView: View {
    @ObservedObject var viewModel: InstrumentsListVM
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.instruments) { instrument in
                    InstrumentCell(instrument: instrument.name, exchange: instrument.exchange, quote: instrument.quote)
                        .background(Color.white)
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color("E5E5E5"))
                        .listRowSeparator(.hidden)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                        .task {
                            guard instrument.id == viewModel.instruments.last?.id else {
                                return
                            }
                            viewModel.page += 1
                            print("Loading page: \(viewModel.page)")
                            viewModel.instruments += await viewModel.loadInstruments(page: viewModel.page)
                        }
                }
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .task {
                viewModel.instruments = await viewModel.loadInstruments()
            }
            .navigationTitle("Stock3")
        }
    }
}

struct InstrumentsListView_Previews: PreviewProvider {
    static var previews: some View {
        InstrumentsListView(viewModel: InstrumentsListVM(fetchInstrumentsUseCase: DefaultFetchInstrumentsUseCase(instrumentsRepository: InstrumentRepository())))
    }
}
