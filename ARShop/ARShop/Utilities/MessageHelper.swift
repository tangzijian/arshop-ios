//
//  MessageHelper.swift
//  ARShop
//
//  Created by Tang Zijian on 3/1/16.
//  Copyright © 2016 sg.edu.nus. All rights reserved.
//

import UIKit
import CRToast

class MessageHelper: NSObject {
    var options: [NSObject: AnyObject] = [
        kCRToastTextAlignmentKey : NSTextAlignment.Center.rawValue,
        kCRToastAnimationInTypeKey : CRToastAnimationType.Spring.rawValue,
        kCRToastAnimationOutTypeKey : CRToastAnimationType.Spring.rawValue,
        kCRToastAnimationInDirectionKey : CRToastAnimationDirection.Top.rawValue,
        kCRToastAnimationOutDirectionKey : CRToastAnimationDirection.Top.rawValue,
        kCRToastTimeIntervalKey: 1.2
    ]
    
    static let sharedInstance = MessageHelper()
    
    func showErrorWithText(text: String) {
        options[kCRToastTextKey] = text
        options[kCRToastBackgroundColorKey] = UIColor.redColor()
        CRToastManager.dismissAllNotifications(false)
        CRToastManager.showNotificationWithOptions(options, completionBlock: nil)
    }
    
    func showSuccessWithText(text: String) {
        options[kCRToastTextKey] = text
        options[kCRToastBackgroundColorKey] = UIColor.greenColor()
        CRToastManager.dismissAllNotifications(false)
        CRToastManager.showNotificationWithOptions(options, completionBlock: nil)
    }
}
