//
//  TableViewGroup1.swift
//  Weather
//
//  Created by Руслан Мотин on 20.01.2022.
//

import UIKit

class TableViewMyGroup: UITableViewController {
    var mass: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Мои группы"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mass.count
    }

   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "0001", for: indexPath) as! CellMyGroup
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
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Удалить", handler: { _,_,_ in self.mass.remove(at: indexPath.row)
            tableView.reloadData() } )
        let actionDelete = UISwipeActionsConfiguration(actions: [delete])
        return actionDelete
    }
   
    @IBAction func addGroup (segue: UIStoryboardSegue) {
        // Проверяем идентификатор перехода, чтобы убедиться, что это нужный
                if segue.identifier == "addCity" {
                // Получаем ссылку на контроллер, с которого осуществлен переход
                    guard let allCitiesController = segue.source as? TableViewSearchGroup else { return }
                // Получаем индекс выделенной ячейки
                    if let indexPath = allCitiesController.tableView.indexPathForSelectedRow {
                // Получаем город по индексу
                        let city = allCitiesController.mass[indexPath.row]
                // Проверяем, что такого города нет в списке
                        if !mass.contains(city) {
                // Добавляем город в список выбранных
                            mass.append(city)
                // Обновляем таблицу
                            tableView.reloadData()
                        }
           }
         }
       }
     }

