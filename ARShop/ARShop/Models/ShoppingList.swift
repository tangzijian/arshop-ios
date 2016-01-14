//
//  ShoppingList.swift
//  ARShop
//
//  Created by Tang Zijian on 14/1/16.
//  Copyright © 2016 sg.edu.nus. All rights reserved.
//

import UIKit

class ShoppingList: NSObject {
    var list = [ShoppingItem]()
    var createdAt: NSDate
    var name = ""
    
    override init() {
        createdAt = NSDate()
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder){
        let data = NSKeyedArchiver.archivedDataWithRootObject(list)
        aCoder.encodeObject(data, forKey: "list")
        aCoder.encodeObject(createdAt, forKey: "created_at")
        aCoder.encodeObject(name, forKey: "name")
    }
    
    required init?(coder aDecoder: NSCoder) {
        createdAt = NSDate()
        if let data = aDecoder.decodeObjectForKey("list") as? NSData {
            if let l = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [ShoppingItem] {
                list = l
            }
        }
        if let val = aDecoder.decodeObjectForKey("created_at") as? NSDate {
            createdAt = val
        }
        if let n = aDecoder.decodeObjectForKey("name") as? String {
            name = n
        }
    }
    
    func listToString() -> String {
        var text = "("
        for i in 0..<list.count {
            let item = list[i]
            text.appendContentsOf(item.name)
            if i < list.count-1 {
                text.appendContentsOf(",")
            }
        }
        text.appendContentsOf(")")
        return text
    }
}
