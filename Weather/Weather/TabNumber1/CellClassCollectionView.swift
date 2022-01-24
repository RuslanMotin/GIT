//
//  CellClassCollectionView.swift
//  Weather
//
//  Created by Руслан Мотин on 18.01.2022.
//

import UIKit

class CellClassCollectionView: UICollectionViewCell {
    
    @IBOutlet var imageCollection: UIImageView!
    
    @IBOutlet var cellCollection: UIView!
    
    @IBOutlet var label: UILabel!

    let like = Like(frame: CGRect(x: 76, y: 83, width: 80, height: 80))
    
}


