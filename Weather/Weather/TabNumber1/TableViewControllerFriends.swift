//
//  TableViewController.swift
//  Weather
//
//  Created by Руслан Мотин on 18.01.2022.
//

import UIKit


class TableViewControllerFriends: UITableViewController {
    
    private enum Constant {
        static let headerIdentifier = "HeaderIdentifier"
    }
    
    var friends: [CellClassModel] = [.init(text: ["Андрей"], image: UIImage(named: "Андрей")), .init(text: ["Василий"], image: UIImage(named: "Василий")), .init(text: ["Николай"], image: UIImage(named: "Николай"))]
    
    var filterFriends: [CellClassModel] = []
    static  var name: [String] = []

    @IBOutlet var tableViewFriends: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let header = HeaderCollectionReusableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        header.configure(withDelegate: self)
        tableViewFriends.tableHeaderView = header
        filterFriends = friends
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        filterFriends.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterFriends[section].text.count
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "0000") as! CellClass
        let friendName = filterFriends[indexPath.section]
        cell.configure(model: friendName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TableViewControllerFriends.name = friends[indexPath.section].text
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        15
    }
  
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let result = String(friends[section].text[0].first!)
        if section == 0 {
            return result
        } else if section == 1 {
            return result
        }
        return result
    }
}

extension TableViewControllerFriends: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filterFriends = friends
        } else {
            filterFriends = friends.filter({ model in
                guard let name = model.text.first else {
                    return false
                }
                return name.lowercased().contains(searchText.lowercased())
            })
        }
        tableViewFriends.reloadData()
    }
}


