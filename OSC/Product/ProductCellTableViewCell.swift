//
//  ProductCellTableViewCell.swift
//  OSC
//
//  Created by Dyan Galih on 26/06/19.
//  Copyright © 2019 Dyan Galih. All rights reserved.
//

import UIKit

class ProductCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleViewTxt: UILabel!
    @IBOutlet var priceViewTxt: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    func setTitle(title: String) {
        self.titleViewTxt.text = title
    }

    func setPrice(price: Int32) {
        self.priceViewTxt.text = String(price)
    }

    func setImage(image: UIImage) {
        self.imgView.image = image
    }
}
