//
//  HeroModel.swift
//  Marvel-Comics
//
//  Created by Hector Carmona on 10/3/22.
//

import Foundation
import UIKit
import Kingfisher

struct HeroModel {
    
    let name: String
    let description: String?
    let imagePath: String
    let imageExtension: String
    let series: [String]?
    
    // Atributo que apunta a la URL de la imagen uniendo la URL base con la extension y sustituyendo HTTPS en lugar de HTTP para poder acceder y hacerlo de manera sefura
    var imageURL: String {
        let string = imagePath.dropFirst(7) // Eliminar "http://" para despues agregarle "https://".
        return "https://" + string + "." + imageExtension // Unir "https://" con la URL base mas la extension.
    }
    
}
