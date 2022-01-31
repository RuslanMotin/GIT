//
//  TableViewController.swift
//  Weather
//
//  Created by Руслан Мотин on 18.01.2022.
//

import UIKit


class TableViewControllerFriends: UITableViewController {
    
    
    var friends = ["Андрей", "Василий", "Николай"] 
    static  var name = ""
    
    @IBOutlet var tableViewFriends: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "0000") as! CellClass
        let friendName = friends[indexPath.row]
        let model = CellClassModel(
            text: friendName,
            image: UIImage(named: friendName)
        )
        cell.configure(model: model)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TableViewControllerFriends.name = friends[indexPath.row]
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var text = String()
        text = friends[section]
        let result = String(text.first!)
        return result
    }
}
