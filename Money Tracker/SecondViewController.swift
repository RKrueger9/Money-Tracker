//
//  SecondViewController.swift
//  Money Tracker
//
//  Created by RKrueger on 12/6/16.
//  Copyright © 2016 RKrueger. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var oweTableView: UITableView!
       @IBOutlet weak var editButton: UIBarButtonItem!

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "oweCell")
        
        //cell.textLabel?.text = taskMgr.tasks[indexPath.row].name
        //cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].desc
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }

    @IBAction func editButton(_ sender: UIBarButtonItem)
    {
        print(5)
    }
    
    @IBAction func addButton(_ sender: AnyObject)
    {
        print(1)
    }
    
    
    
    
    
    
}

