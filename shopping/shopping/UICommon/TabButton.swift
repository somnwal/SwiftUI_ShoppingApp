//
//  TabButton.swift
//  shopping
//
//  Created by CHOI on 8/1/24.
//

import SwiftUI

struct TabButton: View {
    
    @State var title: String = "Title"
    @State var icon: String = "store_tab"
    
    var isSelected: Bool = false
    var didSelect: ( () -> () )?
    
    var body: some View {
        Button {
            didSelect?()
        } label: {
            VStack {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                
                Text(title)
                    .font(.customfont(.semibold, fontSize: 14))
                
            }
        }
        .foregroundColor(isSelected ? .primaryColor : .primaryText)
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

#Preview {
    TabButton()
}
