//
//  CategoryCell.swift
//  shopping
//
//  Created by CHOI on 8/1/24.
//

import SwiftUI

struct CategoryCell: View {
    @State var color: Color = Color.yellow
    var didAddCart: ( () -> () )?
    
    var body: some View {
        HStack {
            Image("pulses")
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
            
            Text("잡곡류")
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(15)
        .frame(width: 250, height: 100)
        .background(color.opacity(0.3))
        .cornerRadius(16)
    }
}

#Preview {
    CategoryCell()
}
