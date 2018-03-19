//
//  ProductModel.swift
//  lezasolutionsApp
//
//  Created by Sanjay Mali on 15/03/18.
//  Copyright © 2018 Sanjay Mali. All rights reserved.
//

import Foundation

struct ProductModel:Decodable{
    var success:Bool?
    var status:Int?
    var message:String!
    var data:ProudctData
}
struct ProudctData:Decodable{
    var products:[Products]
    var total_products:String?
    var total_pages:Int?
}
struct Products:Decodable {
    var id:String?
    var name:String?
    var short_description:String?
    var description:String?
    var currency_code:String?
    var SKU:String?
    var image:String?
    var regular_price:String?
    var final_price:String?
    var boutique_name:String?

}
