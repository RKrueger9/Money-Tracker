//
//  Money.swift
//  Money Tracker
//
//  Created by RKrueger on 12/6/16.
//  Copyright © 2016 RKrueger. All rights reserved.
//

import UIKit
import CoreData

class Money: NSObject, NSCoding
{
    var name = ""
    var amount = ""
    
    init(name : String, amount : String)
    {
        self.name = name
        self.amount = amount
    }
    
    //initilizer is used for loading object of class
    required init?(coder aDecoder: NSCoder)
    {
        name = aDecoder.decodeObject(forKey: "name") as! String
        amount = aDecoder.decodeObject(forKey: "amount") as! String
    }
    
    //used for saving
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(name,forKey: "name")
        aCoder.encode(amount,forKey: "amount")
        
    }    
}
