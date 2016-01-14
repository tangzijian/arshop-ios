//
//  ShoppingListCell.swift
//  ARShop
//
//  Created by Tang Zijian on 14/1/16.
//  Copyright © 2016 sg.edu.nus. All rights reserved.
//

import UIKit

class ShoppingListCell: UITableViewCell {
    
    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var list: ShoppingList? {
        didSet {
            if let l = list {
                listLabel.text = l.listToString()
                dateLabel.text = DateUtil.stringFromDate(l.createdAt)
            }
        }
    }
    
    
}
