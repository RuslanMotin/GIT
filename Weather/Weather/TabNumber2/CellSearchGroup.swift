//
//  CellGroup2.swift
//  Weather
//
//  Created by Руслан Мотин on 20.01.2022.
//

import UIKit

class CellSearchGroup: UITableViewCell {
   
    
    @IBOutlet var labelCell: UILabel!
    let maskLayer = CAShapeLayer()
    var imageGroup = UIImageView(frame: CGRect(x: 20, y: 0, width: 85, height: 80))
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
