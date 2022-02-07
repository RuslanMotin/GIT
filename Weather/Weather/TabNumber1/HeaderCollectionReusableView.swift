//
//  HeaderCollectionReusableView.swift
//  Weather
//
//  Created by Руслан Мотин on 05.02.2022.
//

import UIKit

class HeaderCollectionReusableView: UIView {
    
    private let searchBar = UISearchBar()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
  
    private func setUpUI() {
        addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(withDelegate delegate: UISearchBarDelegate) {
        searchBar.delegate = delegate
    }
}
