//
//  AddPeopleViewController.swift
//  Money Tracker
//
//  Created by RKrueger on 12/8/16.
//  Copyright © 2016 RKrueger. All rights reserved.
//

import UIKit

class AddPeopleViewController: UIViewController
{
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem)
    {
       dismiss(animated: true, completion: nil)     }
    
    @IBAction func doneButton(_ sender: AnyObject)
    {
        if(nameTextField.text! == "" && amountTextField.text! == "")
        {
            
        }
        else
        {
            moneyMgr.addPerson(name: nameTextField.text!, amount: Double(amountTextField.text!)!)
            dismiss(animated: true, completion:{})
        }
    }
    
    
    
}
