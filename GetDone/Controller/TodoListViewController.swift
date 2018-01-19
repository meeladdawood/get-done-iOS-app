//
//  ViewController.swift
//  GetDone
//
//  Created by Meelad Dawood on 1/13/18.
//  Copyright © 2018 Meelad Dawood. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    var itemArray = [Item]()
    let defaults =  UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.separatorStyle = .none
        
        let newItem = Item(task: "Find Mikey")
        itemArray.append(newItem)
        
//        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
//            itemArray =  item
//        }
    }

   //MARK - TableView Datasource methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        
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
            let newItem = Item(task: textField.text!)
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            self.tableView.reloadData()
        
        }
        let cancelAdd = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
       
        alert.addAction(addItemAction)
        alert.addAction(cancelAdd)
        
        present(alert, animated: true, completion: nil)
        
        
        
        
    }
    



}

