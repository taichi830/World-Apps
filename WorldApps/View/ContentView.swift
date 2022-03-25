//
//  ContentView.swift
//  World Apps
//
//  Created by taichi on 2022/03/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = AppViewModel()
    var body: some View {
        NavigationView {
            VStack {
                List {
                    CountryList(countryData: CountryData(), viewModel: viewModel)
                        .listRowInsets(EdgeInsets())
                    ForEach(viewModel.AppsData?.feed.results ?? []) { result in
                        if let index = viewModel.AppsData?.feed.results.firstIndex(where: {
                            $0.id == result.id
                        }) {
                            AppRow(result: result, row: index + 1)
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle(viewModel.navigationTitle)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("無料App").font(.system(size: 17)).foregroundColor(.blue)
                }
            }
        }
        
        
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
