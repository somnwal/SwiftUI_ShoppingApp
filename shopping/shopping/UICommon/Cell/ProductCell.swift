//
//  ProductCell.swift
//  shopping
//
//  Created by CHOI on 8/1/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductCell: View {
    
    @State var obj: ProductModel = ProductModel(productInfo: [
        "name": "샤인머스캣",
        "detail": "씨 없는 달콤한 샤인머스캣 포도",
        "unit_name": "송이",
        "unit_value": 1,
        "nutrition_weight": "500g",
        "price": 18000,
        "image": "https://i.namu.wiki/i/5GByCyLRdvR7fB8wxyZvM8-yJFHSbJ80Ct0EFpKzOsfBxkOJOMVN4AJeVDDs9hcbaljlYEa-QHFhBexkwsk_Xr0LxowpPcbKt-up6sCo-S_ocdiCOHzvzK2I75gkHtLhvsxm3Sjnbh_Pp6J69EbQQw.webp",
        "discountRate": 22,
        "salesCount": 0,
        "likes": 0,
        "offer_price": 14040,
        "cat_id": "66ab84b219c5be4b267b6c8f",
        "cat_name": "과일",
        "type_id": "66ab83bf19c5be4b267b6c89",
        "type_name": "과일",
    ])
    
    var didAddCart: ( () -> () )?
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: obj.image))
                .resizable()
                .indicator(.activity) // Activity Indicator
                .scaledToFit()
                .frame(height: 135)
                .cornerRadius(16, corners: [.topLeft, .topRight])
                .transition(.fade(duration: 0.5))
                .frame(minWidth: 180, maxWidth: 180)
            
            Spacer()
            
            Text(obj.name)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Text("\(obj.unitValue) \(obj.unitName)")
                .font(.customfont(.medium, fontSize: 14))
                .foregroundColor(.secondaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            HStack {
                Text("\(obj.offerPrice) ₩")
                    .font(.customfont(.medium, fontSize: 18))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Button {
                    didAddCart?()
                } label: {
                    Image("add")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                }
                .frame(width: 40, height: 40)
                .background(Color.primaryColor)
                .cornerRadius(15)
            }
            .padding(.bottom, 10)
        }
        .padding(15)
        .frame(width: 180, height: 230)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.placeholder.opacity(0.5), lineWidth: 1)
        }
    }
}

#Preview {
    ProductCell()
}
