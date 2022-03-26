//
//  AppViewModel.swift
//  World Apps
//
//  Created by taichi on 2022/03/23.
//

import Foundation
import Combine

class AppViewModel: ObservableObject {
    private var cancellable = Set<AnyCancellable>()
    var tapEvent = PassthroughSubject<Void,Never>()
    @Published var isLoading: Bool = true
    @Published var results: [Results] = []
    @Published var navigationTitle : String = "Top50: 日本"
    @Published var country: CountryID = .japan
    @Published var chart: Chart = .free
    
    init() {
        callAPI()
        tapEvent.sink { [weak self] _ in
            self?.isLoading = true
            self?.results = []
            self?.callAPI()
        }
        .store(in: &cancellable)
    }
    
    private func callAPI() {
        API.shared.fetchAppRanking(country: country, chart: chart, limit: .fifty)
            .sink {
                print ("completion: \($0)")
            } receiveValue: { [weak self] Apps in
                self?.results = Apps.feed.results
                self?.isLoading = false
            }
            .store(in: &cancellable)
    }
    
}
