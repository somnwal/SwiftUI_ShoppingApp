//
//  LoginView.swift
//  shopping
//
//  Created by CHOI on 7/31/24.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var loginVM = MainViewModel.shared
    
    var body: some View {
        ZStack {
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack {
                Image("color_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                
                Spacer()
                    .frame(height: .screenWidth * 0.12)
                
                Text("로그인")
                    .font(.customfont(.semibold, fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 4)
                
                Text("쇼핑몰에 로그인")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, .screenWidth * 0.1)
                
                LineTextField(txt: $loginVM.txtEmail, title: "이메일", placeholder: "이메일을 입력해주세요.", keyboardType: .emailAddress)
                    .padding(.bottom, .screenWidth * 0.07)
                
                LineSecureField(txt: $loginVM.txtPassword, title: "비밀번호", placeholder: "비밀번호를 입력해주세요.", isShowPassword: $loginVM.isShowPassword)
                    .padding(.bottom, .screenWidth * 0.02)
                
                Button {
                    
                } label: {
                    Text("비밀번호를 잊으셨나요?")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.primaryText)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, .screenWidth * 0.03)
                
                RoundButton(title: "로그인") {
                    loginVM.login()
                }
                .padding(.bottom, .screenWidth * 0.03)
                
                HStack {
                    
                    Text("계정이 없으신가요?")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.primaryText)
                    
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("회원가입")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.primaryColor)
                    }
                }
                
                Spacer()
            }
            .padding(.top, .topInsets + 64)
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets)
            
            VStack {
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
        }
        .alert(isPresented: $loginVM.showError) {
            Alert(title: Text("알림"), message: Text(loginVM.errorMessage), dismissButton: .default(Text("확인")))
        }
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
    
}

#Preview {
    LoginView()
}
