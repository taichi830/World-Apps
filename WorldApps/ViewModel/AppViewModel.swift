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
    @Published var AppsData: Apps?
    
    init() {
        API.shared.fetchAppRanking(country: .japan, chart: .free, limit: .fifty)
            .sink {
                print ("completion: \($0)")
            } receiveValue: { [weak self] Apps in
                self?.AppsData = Apps
            }
            .store(in: &cancellable)
    }
    
}
