//
//  CollectionViewCollectionViewController.swift
//  Weather
//
//  Created by Руслан Мотин on 18.01.2022.
//

import UIKit



class CollectionView: UICollectionViewController {
    var mass = ["Андрей","Василий","Николай"]
    var name = ""
    var resultLike = 0 {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingController()
        navigationItem.title = name
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "0000", for: indexPath) as! CellClassCollectionView
        let _ = cell.imageCollection.image = UIImage(named: name)
        let maskLayer = CAShapeLayer()
        cell.like.backgroundColor = .clear
        cell.like.layer.masksToBounds = true
        let path = UIBezierPath()
        maskLayer.path = cell.like.baizerPath(path: path).cgPath
        cell.like.layer.mask = maskLayer
        view.addSubview(cell.like)
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapOnCustomView))
       
        cell.label.text = String(resultLike)
        if cell.label.text == "1" {
            cell.like.backgroundColor = .red
        } else {
            cell.like.backgroundColor = .clear
        }
        view.addGestureRecognizer(tap)
        return cell
    }
    
    @objc func didTapOnCustomView() {
        if resultLike == 0 {
            resultLike += 1
            } else {
            resultLike = 0
            }
          print("функция вызвана")
    }
    
    func loadingController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let data = storyboard.instantiateViewController(withIdentifier: "TableViewControllerFriends") as! TableViewControllerFriends
        let result = data.userDefault.string(forKey: "1")
        name = mass[Int(result!)!]
    }
}

