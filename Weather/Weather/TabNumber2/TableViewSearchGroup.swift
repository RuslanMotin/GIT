//
//  TableViewGroup2.swift
//  Weather
//
//  Created by Руслан Мотин on 20.01.2022.
//

import UIKit

class TableViewSearchGroup: UITableViewController {
    var mass: [String] = ["Цветы", "Одежда", "Мебель"]
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

   
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mass.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addCity", for: indexPath) as! CellSearchGroup
        cell.imageGroup.layer.cornerRadius = 35
        cell.imageGroup.layer.masksToBounds = true // если поменять на фолс то сработает тень и будет без округления
        cell.imageGroup.layer.shadowColor = UIColor.black.cgColor
        cell.imageGroup.layer.shadowOpacity = 0.5
        cell.imageGroup.layer.shadowRadius = 34
        cell.imageGroup.layer.shadowOffset = CGSize.zero
        cell.imageGroup.image = UIImage(named: mass[indexPath.row])
        cell.addSubview(cell.imageGroup)
        cell.labelCell.text = mass[indexPath.row]
        return cell
    }
}



