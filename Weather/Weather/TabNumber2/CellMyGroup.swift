//
//  CellGroup1.swift
//  Weather
//
//  Created by Руслан Мотин on 20.01.2022.
//

import UIKit

class CellMyGroup: UITableViewCell {
    
    @IBOutlet var labelCell: UILabel!
    
private var imageGroup = UIImageView(frame: CGRect(x: 20, y: 0, width: 85, height: 80))
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageGroup.layer.cornerRadius = 35
        imageGroup.layer.masksToBounds = true // если поменять на фолс то сработает тень и будет без округления
        imageGroup.layer.shadowColor = UIColor.black.cgColor
        imageGroup.layer.shadowOpacity = 0.5
        imageGroup.layer.shadowRadius = 34
        imageGroup.layer.shadowOffset = CGSize.zero
        addSubview(imageGroup)
     }
    
    func configure(model: Group) {
        imageGroup.image = model.image
        labelCell.text = model.text
    }
}
