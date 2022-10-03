//
//  Extensions.swift
//  Marvel-Comics
//
//  Created by Hector Carmona on 9/29/22.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    // Funcion agregada como extension a la clase UIImageView para obtener imagenes atraves de solicitud HTTP de manera mas efectiva y sencilla con el uso de libreria KingFisher.
    
    func setImage(imageURL: String) {
        self.kf.setImage(with: URL(string: imageURL))
    }
}
