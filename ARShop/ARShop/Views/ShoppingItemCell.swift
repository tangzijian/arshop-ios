//
//  ShoppingItemCell.swift
//  ARShop
//
//  Created by Tang Zijian on 14/1/16.
//  Copyright © 2016 sg.edu.nus. All rights reserved.
//

import UIKit

class ShoppingItemCell: UITableViewCell {
    var name: String? {
        didSet {
            nameLabel?.text = name
        }
    }
    var index: Int? {
        didSet {
            if let ind = index {
                indexLabel?.text = "\(ind). "
            }
        }
    }
    
    private var nameLabel: UILabel?
    private var indexLabel: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        nameLabel = UILabel()
        addSubview(nameLabel!)
        
        indexLabel = UILabel()
        addSubview(indexLabel!)
        
        indexLabel?.snp_makeConstraints(closure: { (make) -> Void in
            make.leading.equalTo(snp_leading).offset(20)
            make.top.equalTo(snp_top)
            make.bottom.equalTo(snp_bottom)
            make.width.equalTo(30)
        })
        nameLabel?.sizeToFit()
        nameLabel?.snp_makeConstraints(closure: { (make) -> Void in
            make.leading.equalTo(indexLabel!.snp_trailing)
            make.centerY.equalTo(snp_centerY)
        })
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
