//
//  RoundButtonLink.swift
//  shopping
//
//  Created by CHOI on 8/1/24.
//

import SwiftUI

struct RoundButtonLink: View {
    @State var title: String = "Title"
    var color: Color = Color.primaryColor
    var image: String?
    var destination: AnyView
    
    var body: some View {
        NavigationLink(destination) {
            
        } label: {
            if let img = image {
                Image(img)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .allowsHitTesting(false)
            }
            
            Text(title)
                .font(.customfont(.semibold, fontSize: 18))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
        .background(color)
        .cornerRadius(20)
    }
}

#Preview {
    RoundButtonLink(title: "Test", image: "fb_logo")
}
