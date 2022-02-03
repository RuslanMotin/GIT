//
//  FooterCollectionReusableView.swift
//  Weather
//
//  Created by Руслан Мотин on 01.02.2022.
//

import UIKit

class FooterCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "Footer"
    
    private var label = UILabel()
    
    
    public func configure() {
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpUI()
    }
    
    func setUpUI() {
        backgroundColor = .systemBlue
        label.text = "hi"
        label.backgroundColor = UIColor.yellow
        addSubview(label)
   }
}
