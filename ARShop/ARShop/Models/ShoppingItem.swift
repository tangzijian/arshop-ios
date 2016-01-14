//
//  ShoppingItem.swift
//  ARShop
//
//  Created by Tang Zijian on 14/1/16.
//  Copyright © 2016 sg.edu.nus. All rights reserved.
//

import UIKit

class ShoppingItem: NSObject {
    var name: String = ""
    
    override init() {
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(name, forKey: "name")
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let n = aDecoder.decodeObjectForKey("name") as? String {
            name = n
        }
    }
}
