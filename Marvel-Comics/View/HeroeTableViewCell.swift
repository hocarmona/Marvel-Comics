//
//  HeroeTableViewCell.swift
//  Marvel-Comics
//
//  Created by Hector Carmona on 10/3/22.
//

import UIKit

class HeroeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var heroeImage: UIImageView!
    @IBOutlet weak var heroeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
