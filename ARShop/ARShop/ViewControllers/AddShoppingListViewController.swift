//
//  AddShoppingListViewController.swift
//  ARShop
//
//  Created by Tang Zijian on 14/1/16.
//  Copyright © 2016 sg.edu.nus. All rights reserved.
//

import UIKit
import SnapKit

class AddShoppingListViewController: UIViewController {
    var items = [ShoppingItem]()
    
    var input: UITextField?
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add Shopping List"
        
        let cancelBtn = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: "cancelButtonHandler:")
        navigationItem.leftBarButtonItem = cancelBtn
        let doneBtn = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: "doneButtonHandler:")
        navigationItem.rightBarButtonItem = doneBtn

        view.backgroundColor = UIColor.whiteColor()
        
        input = UITextField()
        input!.borderStyle = .Line
        view.addSubview(input!)
        
        let addBtn = UIButton()
        addBtn.layer.borderColor = UIColor.darkGrayColor().CGColor
        addBtn.layer.borderWidth = 1
        addBtn.setTitle("Add", forState: .Normal)
        addBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        addBtn.addTarget(self, action: "addButtonHandler:", forControlEvents: .TouchUpInside)
        view.addSubview(addBtn)
        
        tableView = UITableView()
        tableView!.registerClass(ShoppingItemCell.self, forCellReuseIdentifier: "item_cell")
        tableView!.dataSource = self
        tableView!.delegate = self
        view.addSubview(tableView!)
        
        addBtn.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(snp_topLayoutGuideBottom).offset(20)
            make.trailing.equalTo(view.snp_trailing).offset(-20)
            make.width.equalTo(60)
            make.height.equalTo(50)
        }
        input?.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(view.snp_leading).offset(20)
            make.trailing.equalTo(addBtn.snp_leading).offset(-5)
            make.top.equalTo(snp_topLayoutGuideBottom).offset(20)
            make.height.equalTo(50)
        }
        tableView?.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(view.snp_leading).offset(20)
            make.trailing.equalTo(view.snp_trailing).offset(-20)
            make.top.equalTo(input!.snp_bottom).offset(4)
            make.bottom.equalTo(snp_bottomLayoutGuideTop)
        }
    }
    
    func addButtonHandler(sender: UIButton) {
        if input?.text == nil || input?.text == "" {
            MessageHelper.sharedInstance.showErrorWithText("You must enter an item name.")
        } else {
            let text = input!.text!
            let item = ShoppingItem()
            item.name = text
            items.insert(item, atIndex: 0)
            tableView?.reloadData()
            input?.text = ""
        }
    }
    
    func cancelButtonHandler(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func doneButtonHandler(sender: UIBarButtonItem) {
        if items.count<=0 {
            MessageHelper.sharedInstance.showErrorWithText("Shopping list must contain at least one item.")
        } else {
            let list = ShoppingList()
            for item in items {
                list.list.append(item)
            }
            DataClient.sharedInstance.saveShoppingList(list)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}

extension AddShoppingListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("item_cell") as! ShoppingItemCell
        cell.name = items[indexPath.row].name
        cell.index = indexPath.row + 1
        return cell
    }
}