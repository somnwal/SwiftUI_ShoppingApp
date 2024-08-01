//
//  RoundButton.swift
//  shopping
//
//  Created by CHOI on 7/31/24.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "Title"
    var color: Color = Color.primaryColor
    var image: String?
    var didTap: (() -> ())?
    
    var body: some View {
        Button {
            didTap?()
        } label: {
            if let img = image {
                Image(img)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .allowsHitTesting(false)
            }
            
            Text(title)
                .font(.customfont(.bold, fontSize: 18))
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
    RoundButton(title: "Test", image: "fb_logo")
}
