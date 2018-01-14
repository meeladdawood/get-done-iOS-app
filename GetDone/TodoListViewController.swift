//
//  ViewController.swift
//  GetDone
//
//  Created by Meelad Dawood on 1/13/18.
//  Copyright © 2018 Meelad Dawood. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    var itemArray = ["Find the cat", "Buy the milk", "Sell the books"]
    let defaults =  UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.separatorStyle = .none
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
            itemArray =  items
        }
    }

   //MARK - TableView Datasource methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK - TableView Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add new items sections
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
    
        let alert = UIAlertController(title: "Add To-Do", message: "", preferredStyle: .alert)
        
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField =  alertTextField
            
        }
        
        
        let addItemAction = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen once the user has clicked the Add Item alert button
            self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            self.tableView.reloadData()
        
        }
        let cancelAdd = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
       
        alert.addAction(addItemAction)
        alert.addAction(cancelAdd)
        
        present(alert, animated: true, completion: nil)
        
        
        
        
    }
    



}

