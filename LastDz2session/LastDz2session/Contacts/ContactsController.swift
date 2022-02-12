//
//  ViewController.swift
//  LastDz2session
//
//  Created by Руслан Мотин on 09.02.2022.
//

import UIKit
import CoreData

class ContactsController: UIViewController {
    
   let coreData = FuncCoreData()
    
   static var mass: [ContactCoreData] = []
    
    @IBOutlet var tableView: UITableView!
    
    let addButton = UIButton(frame: CGRect(x: 311, y: 40, width: 80, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        coreData.fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coreData.fetchData()
    }
    
    func configureView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapButton))
        view.addSubview(addButton)
        addButton.setTitle("Add", for: .normal)
        addButton.backgroundColor = .green
        addButton.tintColor = .cyan
        addButton.layer.cornerRadius = 20
        addButton.addGestureRecognizer(tap)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func didTapButton() {
        alert()
    }
    
    func alert() {
        let alert = UIAlertController(title: "Создание нового контакта", message: "Введите имя и номер телефона", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Имя"
        }
        alert.addTextField { textField in
            textField.placeholder = "Номер телефона"
        }
        let cancel = UIAlertAction(title: "Закрыть", style: .destructive, handler: nil)
        let ok = UIAlertAction(title: "Готово", style: .cancel) { _ in
            let textFieldFirst = alert.textFields![0] as UITextField
            let textFieldLast = alert.textFields![1] as UITextField
            self.coreData.saveCoreData(name: (textFieldFirst.text ?? ""), phone: (textFieldLast.text ?? ""))
            self.tableView.reloadData()
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - конфигурация TableView

extension ContactsController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactsController.mass.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Contact") as! ContactCell
        cell.name.text = ContactsController.mass[indexPath.row].name
        cell.phone.text = ContactsController.mass[indexPath.row].number
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Удалить") { _,_,_  in
            self.coreData.deleteData(element: ContactsController.mass[indexPath.row])
            tableView.reloadData()
        }
        let delete = UISwipeActionsConfiguration(actions: [action])
        return delete
    }
}
