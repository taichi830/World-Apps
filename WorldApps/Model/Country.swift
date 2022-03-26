//
//  Country.swift
//  WorldApps
//
//  Created by taichi on 2022/03/24.
//

import Foundation
import SwiftUI

enum ImageName: String {
    case japan
    case korea
    case taiwan
    case usa
    case spain
    case france
}

struct Country: Identifiable {
    var id = UUID()
    let country: CountryID
    let name: String
    let imageName: ImageName
    let color: Color
}

struct CountryData {
    let data = [
        Country(country: .japan, name: "日本", imageName: .japan, color: .red),
        Country(country: .korea, name: "韓国", imageName: .korea, color: .blue),
        Country(country: .taiwan, name: "台湾", imageName: .taiwan, color: .pink),
        Country(country: .usa, name: "アメリカ", imageName: .usa, color: .green),
        Country(country: .spain, name: "スペイン", imageName: .spain, color: .yellow),
        Country(country: .france, name: "フランス", imageName: .france, color: .purple),
    ]
}


