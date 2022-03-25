//
//  Apps.swift
//  World Apps
//
//  Created by taichi on 2022/03/22.
//

import SwiftUI
import Kingfisher

struct AppRow: View {
    var result: Results
    var row: Int
    @Environment(\.openURL) var openURL
    var body: some View {
        HStack {
            KFImage(URL(string: result.artworkUrl100))
                .resizable()
                .frame(width: 65, height: 65)
                .scaledToFill()
                .overlay(
                    RoundedRectangle(cornerRadius: 13)
                        .stroke(Color.init(white: 0.95), lineWidth: 1)
                )
                .cornerRadius(13)
            HStack(alignment: .top, spacing: 10) {
                Text(row.description).fontWeight(.semibold)
                VStack(alignment: .leading, spacing: 2) {
                    Text(result.name).font(.system(size: 17)).lineLimit(2)
                    Text(result.artistName).font(.system(size: 14))
                        .foregroundColor(Color.init(white: 0.6))
                }
            }
            
            
            Spacer()
            
            Button {
                guard let url = URL(string: result.url) else { return }
                openURL(url)
            } label: {
                Text("入手")
                    .foregroundColor(.blue)
                    .font(.system(size: 15, weight: .medium))
            }
            .frame(width: 75, height: 30)
            .background(Color.init(white: 0.9))
            .cornerRadius(40)
            .buttonStyle(.plain)
            

        }
        
    }
}

struct Apps_Previews: PreviewProvider {
    static var previews: some View {
        AppRow(result: Results.init(artistName: "Twitter, Inc.", id: "333903271", name: "Twitter ツイッター", releaseDate: "2009-10-09", kind: "apps", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Purple116/v4/75/ae/73/75ae73fe-77bd-b738-7165-e7dfc4138ae7/ProductionAppIcon-1x_U007emarketing-0-7-0-0-0-85-220.png/100x100bb.png", genres: [], url: "https://apps.apple.com/jp/app/twitter-%E3%83%84%E3%82%A4%E3%83%83%E3%82%BF%E3%83%BC/id333903271"), row: 1)
        .previewLayout(.fixed(width: 375, height: 80))
    }
}
