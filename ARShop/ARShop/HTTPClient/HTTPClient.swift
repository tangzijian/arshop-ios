//
//  HTTPClient.swift
//  ARShop
//
//  Created by Tang Zijian on 3/1/16.
//  Copyright © 2016 sg.edu.nus. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HTTPClient: NSObject {
    func userSignUp(params: [String : AnyObject]?, completion: (json:AnyObject?, isSuccess: Bool)->Void) {
        Alamofire.request(.POST, "\(Constants.EndPoint.baseUrl)users/signup", parameters:params).validate().responseJSON
            {response in
                let json = JSON(data: response.data!)
                if let errs = json["errors"].arrayObject as? [String] {
                    MessageHelper.sharedInstance.showErrorWithText(errs.first!)
                }
                completion(json: response.result.value, isSuccess: response.result.isSuccess)
        }
    }
}
