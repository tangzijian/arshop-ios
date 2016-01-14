//
//  DataClient.swift
//  ARShop
//
//  Created by Tang Zijian on 3/1/16.
//  Copyright © 2016 sg.edu.nus. All rights reserved.
//

import UIKit

class DataClient: NSObject {
    
    static let sharedInstance = DataClient()
    
    func getShoppingLists() -> [ShoppingList] {
        let ud = NSUserDefaults.standardUserDefaults()
        if let data = ud.objectForKey("shopping_lists") as? NSData {
            if let lists = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [ShoppingList] {
                return lists
            }
        }
        return [ShoppingList]()
    }
    
    func saveShoppingLists(lists: [ShoppingList]) {
        let ud = NSUserDefaults.standardUserDefaults()
        let data = NSKeyedArchiver.archivedDataWithRootObject(lists)
        ud.setObject(data, forKey: "shopping_lists")
        ud.synchronize()
    }
    
    func saveShoppingList(list: ShoppingList) {
        var lists = getShoppingLists()
        lists.append(list)
        saveShoppingLists(lists)
    }
}
