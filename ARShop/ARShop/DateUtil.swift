//
//  DateUtil.swift
//  ARShop
//
//  Created by Tang Zijian on 14/1/16.
//  Copyright © 2016 sg.edu.nus. All rights reserved.
//

import UIKit

class DateUtil: NSObject {
    class func stringFromDate(date: NSDate) -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        return formatter.stringFromDate(date)
    }
}
