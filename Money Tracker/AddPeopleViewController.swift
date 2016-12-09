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
    
    let money : Money! = nil
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem)
    {
       dismiss(animated: true, completion: nil)     }
    
    @IBAction func doneButton(_ sender: AnyObject)
    {
        money.moneyOwed.append(Money(name : nameTextField.text!, amount : Int(amountTextField.text!)!))
        dismiss(animated: true, completion: nil)  
    }
    
    
    
    
    
    
    
    
    
}
