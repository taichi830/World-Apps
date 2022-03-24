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
    let name: String
    let imageName: ImageName
    let color: Color
}

struct CountryData {
    let data = [
        Country(name: "Japan", imageName: .japan, color: .red),
        Country(name: "Korea", imageName: .korea, color: .blue),
        Country(name: "Taiwan", imageName: .taiwan, color: .pink),
        Country(name: "usa", imageName: .usa, color: .green),
        Country(name: "spain", imageName: .spain, color: .yellow),
        Country(name: "france", imageName: .france, color: .purple),
    ]
}


