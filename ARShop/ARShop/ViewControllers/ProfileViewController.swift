//
//  ProfileViewController.swift
//  ARShop
//
//  Created by Tang Zijian on 26/12/15.
//  Copyright © 2015 sg.edu.nus. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak private var profileImageView: UIImageView!
    @IBOutlet weak private var usernameLabel: UILabel!
    @IBOutlet weak private var collectionView: UICollectionView!
    
    private var pastPhotos: [UIImage] = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        profileImageView.image = UIImage(named: "mock-user-icon")
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2.0
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderColor = UIColor.whiteColor().CGColor
        profileImageView.layer.borderWidth = 2
        
        usernameLabel.text = "Tang Zijian"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // load mock past photos
        for i in 0...20 {
            let name = "mock-past-photo"+String(i%6)+".jpg"
            if let img = UIImage(named: name) {
                pastPhotos.append(img)
            }
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.parentViewController?.navigationItem.title = "Profile"
        let logoutBtn = UIBarButtonItem(title: "Logout", style:.Plain, target: self, action:"logoutButtonHanlder:")
        logoutBtn.tintColor = UIColor.whiteColor()
        self.parentViewController?.navigationItem.rightBarButtonItem = logoutBtn
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func logoutButtonHanlder(sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PastPhotoViewCell", forIndexPath: indexPath) as! PastPhotoViewCell
        cell.photo = pastPhotos[indexPath.item]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pastPhotos.count
    }
    
    // MARK: - UICollectionViewDelegate

}
