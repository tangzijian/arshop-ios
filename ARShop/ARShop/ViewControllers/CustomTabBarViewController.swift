//
//  CustomTabBarViewController.swift
//  ARShop
//
//  Created by Tang Zijian on 26/12/15.
//  Copyright © 2015 sg.edu.nus. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UITabBarController {
    var selectedImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationItem.hidesBackButton = true;
        self.navigationController?.setNavigationBarHidden(false, animated: false);
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

extension CustomTabBarViewController: UITabBarControllerDelegate {
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        if item.tag == 2 {
            let sheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil, otherButtonTitles: "Select from library", "Camera")
            sheet.showInView(self.view)
        }
    }
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        return !(viewController is CameraViewController)
    }
}

extension CustomTabBarViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

extension CustomTabBarViewController: UIActionSheetDelegate {
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1 {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .PhotoLibrary
            picker.allowsEditing = false
            self.presentViewController(picker, animated: true, completion: nil)
        } else if buttonIndex == 2 {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .Camera
            picker.allowsEditing = false
            self.presentViewController(picker, animated: true, completion: nil)
        }
    }
}
