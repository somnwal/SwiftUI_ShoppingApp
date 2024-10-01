//
//  CategoryCell.swift
//  shopping
//
//  Created by CHOI on 8/1/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryCell: View {
    @State var obj: TypeModel = TypeModel(typeInfo: [
        "id": "66ab83b019c5be4b267b6c87",
        "name": "잡곡",
        "description": "쌀, 현미, 오곡 등",
        "color": "F8A44C",
        "image": "https://www.yyg.go.kr/contents/1038/img_grain01_2.jpg?build_20240423005?quality=50"
    ])
    
    var didAddCart: ( () -> () )?
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: obj.image))
                .resizable()
                .indicator(.activity) // Activity Indicator
                .scaledToFill()
                .frame(height: 100)
                .cornerRadius(16, corners: [.topLeft, .bottomLeft])
                .transition(.fade(duration: 0.5))
                .frame(minWidth: 40, maxWidth: 40)
            
            Spacer()
            
            Text(obj.name)
                .font(.customfont(.bold, fontSize: 18))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 60)
            
        }
        .padding(15)
        .frame(width: 250, height: 100)
        .background(obj.color.opacity(0.3))
        .cornerRadius(16)
    }
}

#Preview {
    CategoryCell()
}
