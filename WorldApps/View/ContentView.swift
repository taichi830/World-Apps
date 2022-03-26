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
        ZStack {
            NavigationView {
                VStack {
                    List {
                        CountryList(countryData: CountryData(), viewModel: viewModel)
                            .listRowInsets(EdgeInsets())
                        ForEach(Array(viewModel.results.enumerated()), id: \.offset) { offset, result in
                            AppRow(result: result, row: offset + 1)
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
            
            if viewModel.isLoading {
                ActivityIndicator()
            }
        }
        
        
        
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
