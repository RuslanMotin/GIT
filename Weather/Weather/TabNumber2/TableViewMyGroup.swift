//
//  TableViewGroup1.swift
//  Weather
//
//  Created by Руслан Мотин on 20.01.2022.



import UIKit

class TableViewMyGroup: UITableViewController, TableViewSearchGroupDelegate {
    func reloadData() {
        tableView.reloadData()
    }
   
    var mass: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Мои группы"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toSearchGroup" else {
            return
        }
        guard let destinationVc = segue.destination as? TableViewSearchGroup else {
            return
        }
        destinationVc.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        alert()
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
        let model = Group(text: mass[indexPath.row], image: UIImage(named: mass[indexPath.row]))
        cell.configure(model: model)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Удалить", handler: { _,_,_ in self.mass.remove(at: indexPath.row)
            tableView.reloadData() } )
        let actionDelete = UISwipeActionsConfiguration(actions: [delete])
        return actionDelete
    }
    
    func alert() {
        if mass.count == 0 {
        let alert = UIAlertController(title: "Список групп пустой :)", message: "Чтобы воспользоваться поиском группы, нажмите на кнопку Search", preferredStyle: .actionSheet)
        let button = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(button)
        present(alert, animated: true, completion: nil)
        } else {
        return
       }
    }
 }

