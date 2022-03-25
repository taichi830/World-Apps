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
    @Published var AppsData: Apps?
    @Published var navigationTitle : String = "Top50: 日本"
    @Published var country: CountryID = .japan
    
    init() {
        callAPI()
        tapEvent.sink { [weak self] _ in
            self?.callAPI()
        }
        .store(in: &cancellable)
    }
    
    private func callAPI() {
        API.shared.fetchAppRanking(country: country, chart: .free, limit: .fifty)
            .sink {
                print ("completion: \($0)")
            } receiveValue: { [weak self] Apps in
                self?.AppsData = Apps
            }
            .store(in: &cancellable)
    }
    
}
