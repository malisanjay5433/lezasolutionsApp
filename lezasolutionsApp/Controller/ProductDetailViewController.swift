//
//  ProductDetailViewController.swift
//  lezasolutionsApp
//
//  Created by Sanjay Mali on 15/03/18.
//  Copyright © 2018 Sanjay Mali. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    @IBOutlet weak var description_Label: UILabel!
    @IBOutlet weak var kwdWithoutOffer_Label: UILabel!
    @IBOutlet weak var kwd_Label: UILabel!
    @IBOutlet weak var productName_Label: UILabel!
    @IBOutlet weak var off_Label: UILabel!
    @IBOutlet weak var product_ImageView:ImageLoader!
    var produt:Products!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateProduct()
    }
    
    private func updateProduct(){
        self.description_Label.text = produt.description
        self.off_Label.text = "15% OFF"
//        self.kwd_Label.text = produt.boutique_name
        self.productName_Label.text = produt.name
        if let strUrl = produt.image!.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
            let imgUrl = URL(string: strUrl) {
            self.product_ImageView.loadImageWithUrl(imgUrl)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
