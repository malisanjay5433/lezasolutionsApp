//
//  ViewController.swift
//  lezasolutionsApp
//
//  Created by Sanjay Mali on 14/03/18.
//  Copyright © 2018 Sanjay Mali. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var totalProducts_Label: UILabel!
    var productModel = [ProductModel]()
    var data = [Products]()
    var productdata:Products?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.getJSON()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    private func getJSON(){
        let api = "http://dev.boutiqat.com/api/v2/search?q=&lang=en&category_id=&attribute_id=&brand_id=&boutique_id=&price_range=&in_stock=&page=1&per_page=10&user_id=297&store=KW&is_featured=1&latest=&sort=1"
        DataManager.getJSONFromURL(api, param: "",completion: { (data, error) in
            let decoder = JSONDecoder()
            do {
                let json = try decoder.decode(ProductModel.self,from:data!)
                if json.success == true{
                    self.data = json.data.products
                    DispatchQueue.main.async {
                        self.totalProducts_Label.text = "\(json.data.products.count) PRODUCTS"
                        self.collectionView.reloadData()
                    }
                }else{
                    print(json.message)
                }
            }
            catch{
                print(error)
            }
        })
    }
}
extension ProductListViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    //MARK: UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1 
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.productdata  = data[indexPath.row]
        performSegue(withIdentifier: "DetailPage", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailPage" {
            let nextScene =  segue.destination as! ProductDetailViewController
            nextScene.produt = self.productdata!
        }
    }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProductCollectionCell
            let data = self.data[indexPath.row]
            cell.layer.cornerRadius = 5.0
            cell.layer.masksToBounds  = true
            cell.off_Label.text = "15% OFF"
            cell.kwd_Label.text = data.regular_price
            cell.kwdWithoutOffer_Label.text = data.final_price
            cell.productName_Label.text = data.boutique_name
            cell.description_Label.text = data.name
            if let strUrl = data.image?.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
                let imgUrl = URL(string: strUrl) {
                cell.product_ImageView.loadImageWithUrl(imgUrl)
            }
            return cell
        }
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
            let itemsPerRow: CGFloat = 2
            let layout = collectionViewLayout as! UICollectionViewFlowLayout
            layout.minimumLineSpacing = 5.0
            layout.minimumInteritemSpacing = 2.0
            let availableWidth = (collectionView.bounds.width - layout.minimumLineSpacing) / itemsPerRow
            return CGSize(width: availableWidth, height: availableWidth + availableWidth + 20)
        }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        UIView.animate(withDuration: 0.5) {
            cell.transform = CGAffineTransform.identity
        }
    }
}

