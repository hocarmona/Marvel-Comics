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
    
    func setImage(imageURL: String) {
        self.kf.setImage(with: URL(string: imageURL))
    }
}
