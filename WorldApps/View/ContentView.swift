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
                    CountryList(countryData: CountryData())
                        .listRowInsets(EdgeInsets())
                    ForEach(viewModel.AppsData?.feed.results ?? []) {
                        AppRow(result: $0)
                            .frame(height: 70)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Top50: 日本")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("無料App").font(.system(size: 15)).foregroundColor(.blue)
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
