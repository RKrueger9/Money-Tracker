//
//  FirstViewController.swift
//  Money Tracker
//
//  Created by RKrueger on 12/6/16.
//  Copyright © 2016 RKrueger. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var owedTableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var moneyOwed = [Money]()
    var name = ""
    var amount = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        //pulls data from disk
        if let savedMoney = defaults.object(forKey: "moneyOwed") as? Data
        {
            //converts data back to an object
            moneyOwed = NSKeyedUnarchiver.unarchiveObject(with: savedMoney) as! [Money]
        }
        owedTableView.reloadData()
        editButton.tag = 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "owedCell")
        
        cell.textLabel?.text = moneyOwed[(indexPath as NSIndexPath).row].name
        cell.detailTextLabel?.text = String(moneyOwed[indexPath.row].amount)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return moneyOwed.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {       //delete function
        if editingStyle == .delete
        {
            moneyOwed.remove(at:(indexPath).row)
            owedTableView.reloadData()
            save()
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //reorder function
        let money = moneyOwed[(sourceIndexPath as NSIndexPath).row]
        moneyOwed.remove(at: (sourceIndexPath as NSIndexPath).row)
        moneyOwed.insert(money, at: (destinationIndexPath as NSIndexPath).row)
        save()
    }
    
    func save()
    {
        //NSKeyedArchive coverts our array into a data object
        let saveData = NSKeyedArchiver.archivedData(withRootObject: moneyOwed)
        let defaults = UserDefaults.standard
        defaults.set(saveData, forKey: "moneyOwed")
    }
    
    func amountAction()  // for text field alert after name alert
    {
        let alert = UIAlertController(title: "New Amount", message: "Add a new amount", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { (action:UIAlertAction) -> Void in
            
            let textField = alert.textFields!.first
            self.amount = (textField?.text!)!
            print(self.amount)
            self.moneyOwed.append(Money(name: self.name, amount: self.amount))
            self.owedTableView.reloadData()
            self.save()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextField { (textField: UITextField) -> Void in }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }

    @IBAction func editButtonTapped(_ sender: UIBarButtonItem)
    {
        if(sender.tag == 0)
        {
            owedTableView.isEditing = true
            sender.tag = 1
        }
        else
        {
            owedTableView.isEditing = false
            sender.tag = 0
        }
    }
    
    @IBAction func addButtonOnTap(_ sender: AnyObject)
    {
        let alert = UIAlertController(title: "New Name", message: "Add a new name", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { (action:UIAlertAction) -> Void in
                                        
                let textField = alert.textFields!.first
                self.name = (textField?.text!)!
                print(self.name)
                self.amountAction()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextField { (textField: UITextField) -> Void in }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}

