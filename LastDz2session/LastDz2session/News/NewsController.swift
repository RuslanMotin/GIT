//
//  NewsController.swift
//  LastDz2session
//
//  Created by Руслан Мотин on 09.02.2022.
//

import UIKit

class NewsController: UIViewController {
    
    var mass: [News] = []
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.jsonParse()
        collectionView.delegate = self
        collectionView.dataSource = self
        /*    collectionView.register(FooterCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionView.identifier)
         */
    }
    
    func jsonParse() {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                    return
                }
                guard let data = data else {
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let news = try decoder.decode([News].self, from: data)
                    self.mass = news
                } catch {
                    print(error)
                }
                self.collectionView.reloadData()
            }
        }.resume()
    }
}

extension NewsController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return insets
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  self.mass.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "News", for: indexPath) as! NewsCell
        cell.image.image = UIImage(named: "новость")
        cell.labelText.text = self.mass[indexPath.row].body
        return cell
    }
    /*
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
     guard kind == UICollectionView.elementKindSectionFooter else { return UICollectionReusableView() }
     let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionView.identifier, for: indexPath) as! FooterCollectionView
     footer.backgroundColor = .gray
     self.collectionView.reloadData()
     return footer
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
     return CGSize(width: 300, height: 250)
     }
     */
    
}

