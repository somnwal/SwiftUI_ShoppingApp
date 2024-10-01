//
//  ProducModel.swift
//  shopping
//
//  Created by CHOI on 8/1/24.
//

import SwiftUI

struct ProductModel: Identifiable, Equatable {
    var id: String = ""
    var catId: String = ""
    var typeId: String = ""
    
    var name: String = ""
    var detail: String = ""
    
    var unitName: String = ""
    var unitValue: Int = 0
    var nutritionWeight: String = ""
    
    var image: String = ""
    var catName: String = ""
    var typeName: String = ""
    var offerPrice: Int = 0
    var price: Int = 0
    
    var isFav: Bool = false
    
    init(productInfo: NSDictionary) {
        self.id = productInfo.value(forKey: "id") as? String ?? ""
        self.catId = productInfo.value(forKey: "cat_id") as? String ?? ""
        self.typeId = productInfo.value(forKey: "type_id") as? String ?? ""
        self.name = productInfo.value(forKey: "name") as? String ?? ""
        self.detail = productInfo.value(forKey: "detail") as? String ?? ""
        self.unitName = productInfo.value(forKey: "unit_name") as? String ?? ""
        self.unitValue = productInfo.value(forKey: "unit_value") as? Int ?? 0
        self.nutritionWeight = productInfo.value(forKey: "nutrition_weight") as? String ?? ""
        self.image = productInfo.value(forKey: "image") as? String ?? ""
        self.catName = productInfo.value(forKey: "cat_name") as? String ?? ""
        self.typeName = productInfo.value(forKey: "type_name") as? String ?? ""
        self.offerPrice = productInfo.value(forKey: "offer_price") as? Int ?? 0
        self.price = productInfo.value(forKey: "price") as? Int ?? 0
        
        self.isFav = productInfo.value(forKey: "is_fav") as? Bool ?? false
        
    }

    static func == (a: ProductModel, b: ProductModel) -> Bool {
        return a.id == b.id
    }
}
