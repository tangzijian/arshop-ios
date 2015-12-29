//
//  DiscoverViewController.swift
//  ARShop
//
//  Created by Tang Zijian on 26/12/15.
//  Copyright © 2015 sg.edu.nus. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.setNavigationBarHidden(false, animated: false);
        self.parentViewController?.navigationItem.title = "Discover"
        self.parentViewController?.navigationItem.rightBarButtonItem = nil;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
