//
//  FuncCoreData.swift
//  LastDz2session
//
//  Created by Руслан Мотин on 12.02.2022.
//
import CoreData
import UIKit

class FuncCoreData: UIViewController {
    
    func saveCoreData(name: String, phone: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let contact = ContactCoreData(entity: ContactCoreData().entity, insertInto: context)
        contact.setValue(name, forKey: "name")
        contact.setValue(phone, forKey: "number")
        do {
            try context.save()
            ContactsController.mass.append(contact)
        } catch let error {
            debugPrint("Не сохраняется", error)
        }
    }
    
    func fetchData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            let result = try context.fetch(ContactCoreData.fetchRequest())
            ContactsController.mass = result
        } catch let error {
            debugPrint("Не достается", error)
        }
    }
    
    func deleteData(element: NSManagedObject) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(element)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
}
