//
//  CellGroup2.swift
//  Weather
//
//  Created by Руслан Мотин on 20.01.2022.
//

import UIKit
protocol CellSearchGroupDelegete: AnyObject {
    func cellButtonDidTab(groupName: String? )
}

class CellSearchGroup: UITableViewCell {
    
    @IBOutlet var labelCell: UILabel!
    let maskLayer = CAShapeLayer()
private var imageGroup = UIImageView(frame: CGRect(x: 20, y: 0, width: 85, height: 80))
    weak var delegate: CellSearchGroupDelegete?
    
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
    
    @IBAction func buttonDidTap(_ sender: UIButton) {
        delegate?.cellButtonDidTab(groupName: labelCell.text)
    }
    
    func configure(model: Group) {
        imageGroup.image = model.image
        labelCell.text = model.text
    }
}

