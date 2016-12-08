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
    
    var owed : [Money] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        editButton.tag = 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "owedCell")
        
        //cell.textLabel?.text = taskMgr.tasks[indexPath.row].name
        //cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].desc
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    /*
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            taskMgr.tasks.remove(at:(indexPath).row)
            myTableView.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let task = taskMgr.tasks[(sourceIndexPath as NSIndexPath).row]
        taskMgr.tasks.remove(at: (sourceIndexPath as NSIndexPath).row)
        taskMgr.tasks.insert(task, at: (destinationIndexPath as NSIndexPath).row)
    }
*/
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem)
    {
        
    }
    
    
}

