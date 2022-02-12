//
//  NewsCell.swift
//  LastDz2session
//
//  Created by Руслан Мотин on 10.02.2022.
//

import UIKit

class NewsCell: UICollectionViewCell {
    @IBOutlet var image: UIImageView!
    
    let labelText = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
       labelText.frame = CGRect(x: 0, y: 270, width: 420, height: 100)
        labelText.backgroundColor = .lightGray
       addSubview(labelText)
    }
}
