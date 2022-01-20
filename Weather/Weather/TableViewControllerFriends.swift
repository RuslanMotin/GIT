//
//  TableViewController.swift
//  Weather
//
//  Created by Руслан Мотин on 18.01.2022.
//

import UIKit

class TableViewControllerFriends: UITableViewController {
    var friends = ["Андрей", "Василий", "Николай"]
    var userDefault = UserDefaults.standard
    
    @IBOutlet var tableViewFriends: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let photo = ["Андрей", "Василий", "Николай"]
        let cell = tableView.dequeueReusableCell(withIdentifier: "0000") as! CellClass
        cell.text1.text = friends[indexPath.row]
        cell.image1.image = UIImage(named: photo[indexPath.row])
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userDefault.removeObject(forKey: "1")
        userDefault.set(indexPath.row, forKey: "1")
    }
}

