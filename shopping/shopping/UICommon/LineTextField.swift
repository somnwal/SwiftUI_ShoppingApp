//
//  LineTextField.swift
//  shopping
//
//  Created by CHOI on 7/31/24.
//

import SwiftUI

struct LineTextField: View {
    @Binding var txt: String
    
    var title: String = "Title"
    var placeholder: String = ""
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            TextField(placeholder, text: $txt)
                .frame(height: 40)
                .autocapitalization(.none)
                .keyboardType(keyboardType)
            
            Divider()
        }
    }
}

struct LineSecureField: View {
    @Binding var txt: String
    
    var title: String = "Title"
    var placeholder: String = ""
    var keyboardType: UIKeyboardType = .default
    @Binding var isShowPassword: Bool
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            if(isShowPassword) {
                TextField(placeholder, text: $txt)
                    .frame(height: 40)
                    .keyboardType(keyboardType)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .modifier(ShowButton(isShow: $isShowPassword))
            } else {
                SecureField(placeholder, text: $txt)
                    .frame(height: 40)
                    .keyboardType(keyboardType)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .modifier(ShowButton(isShow: $isShowPassword))
            }
            
            Divider()
        }
    }
}

struct LineTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        @State var isShowPassword: Bool = false
        
        VStack {
            LineTextField(txt: .constant("123"), title: "제목", placeholder: "입력하세요")
                .padding(.bottom, 20)
            
            LineSecureField(txt: .constant("123"), title: "제목", placeholder: "입력하세요", isShowPassword: $isShowPassword)
        }
    }
}
