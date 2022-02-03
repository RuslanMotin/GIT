//
//  TableViewGroup2.swift
//  Weather
//
//  Created by Руслан Мотин on 20.01.2022.
//

import UIKit
protocol TableViewSearchGroupDelegate: AnyObject {
    var mass: [String] { get set }
    func reloadData()
}

class TableViewSearchGroup: UITableViewController {
    var mass: [String] = ["Цветы", "Одежда", "Мебель"]
weak var delegate: TableViewSearchGroupDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        alert()
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
        let friendName = mass[indexPath.row]
        let model = Group(text: friendName, image: UIImage(named: friendName)!)
        cell.configure(model: model)
        cell.delegate = self
        return cell
    }
    
    func alert() {
        guard let delegate = delegate else { return }
        // Как получить доступ к свойству масс в контроллере Мои группы????
        if  delegate.mass.isEmpty  {
            let alert = UIAlertController(title: "Для добавления нажмите на кнопку + ", message: nil, preferredStyle: .actionSheet)
            let button = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(button)
            present(alert, animated: true, completion: nil)
        }
    }
}

extension TableViewSearchGroup: CellSearchGroupDelegete {
    func cellButtonDidTab(groupName: String?) {
        guard let delegate = delegate, let groupName = groupName else { return }
        if !delegate.mass.contains(groupName) {
            delegate.mass.append(groupName)
            delegate.reloadData()
            mass = mass.filter({ name in
            return name != groupName
            })
            tableView.reloadData()
        }
    }
}


