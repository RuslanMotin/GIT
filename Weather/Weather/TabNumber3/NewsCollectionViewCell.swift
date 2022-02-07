//
//  NewsCollectionViewCell.swift
//  Weather
//
//  Created by Руслан Мотин on 03.02.2022.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    private var like = Like(frame: CGRect(x: 307, y: 343, width: 50, height: 50))
    
    @IBOutlet var imageUser: UIImageView!
    
    @IBOutlet var imageContent: UIImageView!
    
    @IBOutlet var userName: UILabel!
    @IBOutlet var label: UILabel!
    var resultLike = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        like.backgroundColor = .clear
        let maskLayer = CAShapeLayer()
        //like.layer.masksToBounds = true
        let path = UIBezierPath()
        maskLayer.path = like.baizerPath(path: path).cgPath
        like.layer.mask = maskLayer
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapOnCustomView))
        label.text = String(resultLike)
        like.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        addSubview(like)
        like.addGestureRecognizer(tap)
    }
    
    func configure(model: CellClassModel, imageNews: ImageContent) {
        userName.text = model.text[0]
        imageUser.image = model.image
        imageContent.image = imageNews.image
    }
    
    @objc func didTapOnCustomView() {
        if resultLike == 0 {
            resultLike += 1
        } else {
            resultLike = 0
        }
        if resultLike == 1 {
            like.backgroundColor = .red
        } else {
            like.backgroundColor = .clear
        }
        label.text = String(resultLike)
    }
}
