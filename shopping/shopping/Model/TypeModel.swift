//
//  TypeModel.swift
//  shopping
//
//  Created by CHOI on 8/2/24.
//

import SwiftUI

struct TypeModel: Identifiable, Equatable {
    var id: String = ""
    
    var name: String = ""
    var image: String = ""
    var color: Color = Color.primaryColor
    
    init(typeInfo: NSDictionary) {
        self.id = typeInfo.value(forKey: "_id") as? String ?? ""
        self.name = typeInfo.value(forKey: "name") as? String ?? ""
        self.image = typeInfo.value(forKey: "image") as? String ?? ""
        self.color = Color(hex: typeInfo.value(forKey: "color") as? String ?? "000000")
    }
    
    static func == (a: TypeModel, b: TypeModel) -> Bool {
        return a.id == b.id
    }
}
