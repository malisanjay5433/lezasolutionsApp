//
//  ProductCollectionCell.swift
//  lezasolutionsApp
//
//  Created by Sanjay Mali on 15/03/18.
//  Copyright © 2018 Sanjay Mali. All rights reserved.
//

import UIKit
class ProductCollectionCell: UICollectionViewCell {
    @IBOutlet weak var description_Label: UILabel!
    @IBOutlet weak var kwdWithoutOffer_Label: UILabel!
    @IBOutlet weak var kwd_Label: UILabel!
    @IBOutlet weak var productName_Label: UILabel!
    @IBOutlet weak var off_Label: UILabel!
    @IBOutlet weak var product_ImageView:ImageLoader!
}
