//
//  Model.swift
//  Marvel-Comics
//
//  Created by Hector Carmona on 9/28/22.
//

import Foundation

// API PUBLIC KEY: 2e1f8906f07ca504665371350cd38c7e
// MD5 HASH VALUE: 6daf326c8d6c2941c1f11133cf7a62f7

import Foundation

// MARK: - Welcome
struct Heroes: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let name: String
    let description: String?
    let thumbnail: Thumbnail
    let series: Comics
}

// MARK: - Comics
struct Comics: Codable {
    let items: [ComicsItem]
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let name: String
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let `extension`: String
    
}

