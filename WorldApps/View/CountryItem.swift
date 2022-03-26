//
//  CountryItem.swift
//  World Apps
//
//  Created by taichi on 2022/03/24.
//

import SwiftUI

struct CountryItem: View {
    var country: Country
    var isSelected: Bool
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(country.imageName.rawValue)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 80)
                .overlay(TextOverlay(country: country, isSelected: isSelected))
                .cornerRadius(10)
        }
    }
}

struct TextOverlay: View {
    var country: Country
    var isSelected: Bool
    var gradient: LinearGradient {
        LinearGradient.init(gradient: Gradient(colors: [country.color.opacity(0.9), country.color.opacity(0.4)]), startPoint: .bottomLeading, endPoint: .topTrailing)
    }
    var whiteGradient: LinearGradient {
        LinearGradient.init(gradient: Gradient(colors: [.white.opacity(0.7)]), startPoint: .bottomLeading, endPoint: .topTrailing)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(country.name)
                    .font(.system(size: 20, weight: .semibold))
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 0))
            if !isSelected {
                whiteGradient
            }
        }
        .foregroundColor(.white)
    }
}

struct CountryItem_Previews: PreviewProvider {
    static var previews: some View {
        CountryItem(country: Country(country: .korea, name: "Korea", imageName: .korea, color: .blue), isSelected: false)
            .previewLayout(.fixed(width: 200, height: 100))
    }
}
