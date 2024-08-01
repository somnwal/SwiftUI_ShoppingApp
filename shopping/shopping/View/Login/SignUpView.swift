//
//  SignUpView.swift
//  shopping
//
//  Created by CHOI on 8/1/24.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some View {
        ZStack {
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            ScrollView {
                VStack {
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                    
                    Spacer()
                        .frame(height: .screenWidth * 0.12)
                    
                    Text("회원가입")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 4)
                    
                    Text("가입하고 빠른 배송을 경험해보세요.")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, .screenWidth * 0.1)
                    
                    LineTextField(txt: $mainVM.txtUsername, title: "사용자명", placeholder: "사용자명을 입력해주세요.", keyboardType: .emailAddress)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineTextField(txt: $mainVM.txtEmail, title: "이메일", placeholder: "이메일을 입력해주세요.", keyboardType: .emailAddress)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineSecureField(txt: $mainVM.txtPassword, title: "비밀번호", placeholder: "비밀번호를 입력해주세요.", isShowPassword: $mainVM.isShowPassword)
                        .padding(.bottom, .screenWidth * 0.02)
                    
                    VStack {
                        Text("회원가입 시")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            Text("서비스 약관")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.primaryColor)
                            
                            Text("및")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.secondaryText)
                            
                            Text("개인정보처리방침")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.primaryColor)
                            
                            Text("에 동의합니다.")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.secondaryText)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.bottom, .screenWidth * 0.02)
                    }
                    
                    RoundButton(title: "회원가입") {
                        mainVM.signUp()
                    }
                    .padding(.bottom, .screenWidth * 0.05)
                    
                    HStack {
                        
                        Text("이미 계정이 있으신가요?")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.primaryText)
                        
                        NavigationLink {
                            LoginView()
                        } label: {
                            Text("로그인")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.primaryColor)
                        }
                    }
                    
                    Spacer()
                }
                .padding(.top, .topInsets + .screenWidth * 0.2)
                .padding(.horizontal, 20)
                .padding(.bottom, .bottomInsets)
            }
            
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
        .alert(isPresented: $mainVM.showError, content: {
            Alert(title: Text("알림"), message: Text(mainVM.errorMessage), dismissButton: .default(Text("확인")))
        })
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        SignUpView()
    }
}
