//
//  SectionTitle.swift
//  shopping
//
//  Created by CHOI on 8/1/24.
//

import SwiftUI

struct SectionTitle: View {
    var title: String = "Title"
    
    @State var viewAllText: String = "View All"
    var didTap: ( () -> () )?
    
    var body: some View {
        HStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 24))
                .foregroundColor(.primaryText)
            
            Spacer()
            
            Text(viewAllText)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.primaryColor)
        }
        .frame(height: 40)
    }
}

#Preview {
    SectionTitle()
}
