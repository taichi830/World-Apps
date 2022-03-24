//
//  Apps.swift
//  World Apps
//
//  Created by taichi on 2022/03/22.
//

import Foundation

struct Apps: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let id: String
    let author: Author
    let links: [Links]
    let copyright: String
    let country: String
    let icon: String
    let updated: String
    let results: [Results]
}

struct Author: Decodable {
    let name: String
    let url: String
}

struct Links: Decodable {
    let `self`: String
}

struct Results: Decodable, Identifiable {
    let artistName: String
    let id: String
    let name: String
    let releaseDate: String
    let kind: String
    let artworkUrl100: String
    let genres: [Genres]
    let url: String
}

struct Genres: Decodable {
    let genreId: String
    let name: String
    let url: String
}
