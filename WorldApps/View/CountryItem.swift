//
//  CountryItem.swift
//  World Apps
//
//  Created by taichi on 2022/03/24.
//

import SwiftUI

struct CountryItem: View {
    var country: Country
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(country.imageName.rawValue)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 80)
                .overlay(TextOverlay(country: country))
                .cornerRadius(10)
            
        }
    }
}

struct TextOverlay: View {
    var country: Country
    var gradient: LinearGradient {
        LinearGradient.init(gradient: Gradient(colors: [country.color.opacity(0.9), country.color.opacity(0.4)]), startPoint: .bottomLeading, endPoint: .topTrailing)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(country.name)
                    .font(.system(size: 25, weight: .semibold))
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 0))
        }
        .foregroundColor(.white)
    }
}

struct CountryItem_Previews: PreviewProvider {
    static var previews: some View {
        CountryItem(country: Country(name: "Korea", imageName: .korea, color: .blue))
            .previewLayout(.fixed(width: 200, height: 100))
    }
}
