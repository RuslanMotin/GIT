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
        return cell
    }
    
    func loadingController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let data = storyboard.instantiateViewController(withIdentifier: "TableViewControllerFriends") as! TableViewControllerFriends
        let result = data.userDefault.string(forKey: "1")
        name = mass[Int(result!)!]
    }
}

