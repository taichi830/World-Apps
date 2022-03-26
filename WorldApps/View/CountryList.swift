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
    @State var selectedIndex:Int = 0
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 8) {
                ForEach(0..<countryData.data.count) { index in
                    if selectedIndex == index {
                        CountryItem(country: countryData.data[index], isSelected: true)
                    }else {
                        CountryItem(country: countryData.data[index], isSelected: false)
                            .onTapGesture {
                                let feedBack = UIImpactFeedbackGenerator(style: .heavy)
                                feedBack.impactOccurred()
                                selectedIndex = index
                                viewModel.navigationTitle = "Top50: \(countryData.data[index].name)"
                                viewModel.country =  countryData.data[index].country
                                viewModel.tapEvent.send(())
                            }
                    }
                        
                }
            }
            .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 0))
        }
    }
}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryList(countryData: CountryData(), viewModel: AppViewModel())
            .previewLayout(.fixed(width: 375, height: 100))
    }
}
