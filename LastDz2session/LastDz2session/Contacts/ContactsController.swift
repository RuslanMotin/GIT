//
//  ViewController.swift
//  LastDz2session
//
//  Created by Руслан Мотин on 09.02.2022.
//

import UIKit
import CoreData

class ContactsController: UIViewController {
    
    var mass: [ContactCoreData] = []
    
    @IBOutlet var tableView: UITableView!
    
    let addButton = UIButton(frame: CGRect(x: 311, y: 40, width: 80, height: 40))
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
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
            self.saveCoreData(name: (textFieldFirst.text ?? ""), phone: (textFieldLast.text ?? ""))
            self.tableView.reloadData()
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
    
    func saveCoreData(name: String, phone: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let contact = ContactCoreData(entity: ContactCoreData().entity, insertInto: context)
        contact.setValue(name, forKey: "name")
        contact.setValue(phone, forKey: "number")
        do {
            try context.save()
            self.mass.append(contact)
        } catch let error {
            debugPrint("Не сохраняется", error)
        }
    }
    
    func fetchData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            let result = try context.fetch(ContactCoreData.fetchRequest())
            self.mass = result
        } catch let error {
            debugPrint("Не достается", error)
        }
    }
    
   
}

 // MARK: - конфигурация TableView

extension ContactsController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mass.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Contact") as! ContactCell
        cell.name.text = mass[indexPath.row].name
        cell.phone.text = mass[indexPath.row].number
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Удалить") { _,_,_  in
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            context.delete(self.mass[indexPath.row])
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            self.fetchData()
            tableView.reloadData()
        }
        let delete = UISwipeActionsConfiguration(actions: [action])
      return delete
    }
}
