//
//  CellGroup1.swift
//  Weather
//
//  Created by Руслан Мотин on 20.01.2022.
//

import UIKit

class CellGroup1: UITableViewCell {
    
    @IBOutlet var imageCell: UIImageView!
    @IBOutlet var labelCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
