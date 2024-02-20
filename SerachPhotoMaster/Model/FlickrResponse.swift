//
//  FlickrResponse.swift
//  SerachPhotoMaster
//
//  Created by Naresh on 2/20/24.
//

import Foundation

import Foundation
struct FlickrResponse: Codable {
    let items: [FlickrItem]
}

struct FlickrItem: Codable, Identifiable {
    let title: String
    let link: String
    var media: Media
    let date_taken: String
    let description: String
    let published: String
    let author: String
    let author_id: String
    let tags: String

    var id: String {
        link
    }
}

struct Media: Codable {
    var m: String
}
