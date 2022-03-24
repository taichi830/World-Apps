//
//  CountryList.swift
//  World Apps
//
//  Created by taichi on 2022/03/24.
//

import SwiftUI

struct CountryList: View {
    var countryData: CountryData
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 8) {
                ForEach(countryData.data) {
                    CountryItem(country: $0)
                }
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
        }
    }
}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryList(countryData: CountryData())
            .previewLayout(.fixed(width: 375, height: 200))
    }
}
