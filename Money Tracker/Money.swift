//
//  Money.swift
//  Money Tracker
//
//  Created by RKrueger on 12/6/16.
//  Copyright © 2016 RKrueger. All rights reserved.
//

import UIKit

class Money: NSObject
{
    var name = ""
    var amount = 0
    
    
    
    init(name : String, amount : Int)
    {
        self.name = name
        self.amount = amount
    }
}
