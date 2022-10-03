//
//  HeroModel.swift
//  Marvel-Comics
//
//  Created by Hector Carmona on 10/3/22.
//

import Foundation

struct HeroModel {
    
    let name: String
    let description: String?
    let imagePath: String
    let imageExtension: String
    let series: [String]?
    
    var imageURL: String {
        let string = imagePath.dropFirst(7)
        return "https://" + string + "." + imageExtension
    }
    
}
