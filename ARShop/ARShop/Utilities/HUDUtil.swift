//
//  HUDUtil.swift
//  ARShop
//
//  Created by Tang Zijian on 8/1/16.
//  Copyright © 2016 sg.edu.nus. All rights reserved.
//

import UIKit
import MBProgressHUD

class HUDUtil: NSObject {
    
    class func show(view: UIView) {
        MBProgressHUD.showHUDAddedTo(view, animated: true)
    }
    
    class func dismiss(view: UIView) {
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            MBProgressHUD.hideHUDForView(view, animated: true)
        }
    }
    
    class func showErrorWithStatus(text: String, view: UIView) {
        dismiss(view)
        MessageHelper.sharedInstance.showErrorWithText(text)
    }
    
    class func showSuccessWithStatus(text: String, view: UIView) {
        dismiss(view)
        MessageHelper.sharedInstance.showSuccessWithText(text)
    }
}
