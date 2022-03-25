//
//  CountryList.swift
//  World Apps
//
//  Created by taichi on 2022/03/24.
//

import SwiftUI

struct CountryList: View {
    var countryData: CountryData
    var viewModel: AppViewModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 8) {
                ForEach(0..<countryData.data.count) { index in
                    CountryItem(country: countryData.data[index])
                        .onTapGesture {
                            viewModel.navigationTitle = "Top50: \(countryData.data[index].name)"
                            viewModel.country =  countryData.data[index].country
                            viewModel.tapEvent.send(())
                        }
                }
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
        }
    }
}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryList(countryData: CountryData(), viewModel: AppViewModel())
            .previewLayout(.fixed(width: 375, height: 200))
    }
}
