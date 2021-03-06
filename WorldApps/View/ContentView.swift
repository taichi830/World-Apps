//
//  ContentView.swift
//  World Apps
//
//  Created by taichi on 2022/03/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = AppViewModel()
    @State var navName = "無料のApp"
//    @State var showingAlert: Bool = true
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
                .alert(isPresented: $viewModel.showingAlert, content: {
                    Alert(title: Text("エラー"), message: Text("エラーが発生しました"))
                })
                .navigationTitle(viewModel.navigationTitle)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text(navName).foregroundColor(.blue)
                            .contextMenu {
                                Button {
                                    navName = "無料のApp"
                                    viewModel.chart = .free
                                    viewModel.tapEvent.send(())
                                    
                                } label: {
                                    Text("無料のApp")
                                }
                                
                                Button {
                                    navName = "有料のApp"
                                    viewModel.chart = .paid
                                    viewModel.tapEvent.send(())
                                } label: {
                                    Text("有料のApp")
                                }
                                
                            }
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
