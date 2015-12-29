//
//  PastPhotoViewCell.swift
//  ARShop
//
//  Created by Tang Zijian on 29/12/15.
//  Copyright © 2015 sg.edu.nus. All rights reserved.
//

import UIKit

class PastPhotoViewCell: UICollectionViewCell {

    @IBOutlet weak private var photoView: UIImageView!
    var photo: UIImage {
        didSet {
            photoView.image = photo
        }
    }
    
    override init(frame: CGRect) {
        self.photo = UIImage()
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        self.photo = UIImage()
        super.init(coder: aDecoder)
    }
}
