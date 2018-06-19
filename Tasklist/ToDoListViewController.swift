//
//  ViewController.swift
//  Tasklist
//
//  Created by Maha AlDwehy on 05/10/1439 AH.
//  Copyright © 1439 Maha AlDwehy. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController{

    var itemArray = ["Mahas work","Mahas shop","Mahas fun"]
    override func viewDidLoad() {
        super.viewDidLoad()
 }

    //MARK: TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
     //MARK: TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
          
            
            if   tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
                  tableView.cellForRow(at: indexPath)?.accessoryType == .none
            } else {
                  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
            }
            tableView.deselectRow(at: indexPath, animated: true)
        }
    //MARK: Add new Items
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        
        let alert = UIAlertController(title: "Add new Task", message: "", preferredStyle: .alert)
        
        let Action = UIAlertAction(title: "Add Task", style: .default) { (action) in
            //what will happen once the user clicks the add Item button on your UIAlert
           self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Grate New Task"
            textField = alertTextField
          
        }
        
        alert.addAction(Action)
        
        present(alert, animated: true,completion: nil)
        
    }
    
    
}

