//
//  HeroeTableViewCell.swift
//  Marvel-Comics
//
//  Created by Hector Carmona on 10/3/22.
//

import UIKit
import Kingfisher

class HeroeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var heroeImage: UIImageView!
    @IBOutlet weak var heroeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
