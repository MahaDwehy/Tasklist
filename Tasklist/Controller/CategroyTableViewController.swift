//
//  CategroyTableViewController.swift
//  Tasklist
//
//  Created by Maha AlDwehy on 09/10/1439 AH.
//  Copyright © 1439 Maha AlDwehy. All rights reserved.
//

import UIKit
import CoreData

class CategroyTableViewController: UITableViewController {
    var categories = [Category]()
  
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

       loadCategory()
    }


    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        
        let alert = UIAlertController(title: "Add Category", message: "", preferredStyle: .alert)
        
        let Action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newCategory = Category(context: self.context)
          
                       newCategory.name = textField.text!

                       self.categories.append(newCategory)
                   self.saveCategories()

    
        }
         alert.addAction(Action)
        alert.addTextField { (field) in
            textField.placeholder = "add a New category"
        }
      
        present(alert, animated: true,completion: nil)
        
    }
    
     // Mark:
    
    
    func saveCategories() {
        do {
            try context.save()
        } catch {
            print("Error saving categories\(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategory() {
        let request : NSFetchRequest<Category> = Category.fetchRequest()
        do {
            categories = try context.fetch(request)
        } catch {
            print("Error loading categories\(error)")
        }
        tableView.reloadData()
    }
    
    
    // MARK: TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
    
        cell.textLabel?.text = categories[indexPath.row].name
   
        return cell
    }
    
    
    //MARK: TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
           destinationVC.selectedCategory = categories[indexPath.row]
        }
    }


}

    

