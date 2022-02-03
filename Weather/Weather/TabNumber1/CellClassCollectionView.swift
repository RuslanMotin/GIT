//
//  CellClassCollectionView.swift
//  Weather
//
//  Created by Руслан Мотин on 18.01.2022.
//

import UIKit


class CellClassCollectionView: UICollectionViewCell {
    
    @IBOutlet var imageCollection: UIImageView!
    @IBOutlet var label: UILabel!
    
    private  let like = Like(frame: CGRect(x: 85, y: 103, width: 50, height: 50))
    
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


