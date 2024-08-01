//
//  SearchTextField.swift
//  shopping
//
//  Created by CHOI on 8/1/24.
//

import SwiftUI

struct SearchTextField: View {
    @Binding var txt: String
    var placeholder: String = ""
    
    var body: some View {
        HStack(spacing: 15) {
            Image("search")
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12)
            
            
            TextField(placeholder, text: $txt)
                .font(.customfont(.regular, fontSize: 17))
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .frame(height: 30)
        .padding(15)
        .background(Color(hex: "F2F2F2"))
        .cornerRadius(16)
    }
}

struct SearchTextField_Previews: PreviewProvider {
    @State static var txt: String = ""
    
    static var previews: some View {
        SearchTextField(txt: $txt, placeholder: "검색어 입력")
            .padding(.horizontal, 10)
    }
}
