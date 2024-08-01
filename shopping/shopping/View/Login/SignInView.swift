//
//  SignInView.swift
//  shopping
//
//  Created by CHOI on 7/31/24.
//

import SwiftUI
import CountryPicker

struct SignInView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State var txtMobile: String = ""
    @State var isShowCountryPicker: Bool = false
    @State var countryObj: Country?
    
    var body: some View {
        ZStack(alignment: .top) {
            
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack {
                Image("sign_in_top")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth, height: .screenWidth)
                
                Spacer()
            }
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("휴대폰 번호로 인증")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 25)
                    
                    HStack {
                        Button {
                            isShowCountryPicker = true
                        } label: {
                            Image("")
                            
                            if let countryObj = countryObj {
                                Text("\(countryObj.isoCode.getFlag())")
                                    .font(.customfont(.medium, fontSize: 35))
                                    .foregroundColor(.primaryText)
                                
                                Text("+\(countryObj.phoneCode)")
                                    .font(.customfont(.medium, fontSize: 18))
                                    .foregroundColor(.primaryText)
                            }
                        }
                        
                        TextField("휴대폰 번호 입력", text: $txtMobile)
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("이메일로 로그인")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                    .background(Color.primaryColor)
                    .cornerRadius(20)
                    
                    
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
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.vertical, 8)
                    
                    Divider()
                        .padding(.bottom, 25)
                    
                    Text("혹은 소셜미디어와 연결해보세요.")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 25)
                    
                    RoundButton(title: "구글 계정과 연동", color: Color(hex: "5383EC"), image: "google_logo") {
                        
                    }
                    .padding(.bottom, 8)
                    
                    RoundButton(title: "페이스북 계정과 연동", color: Color(hex: "4A66AC"), image: "fb_logo") {
                    }
                }
                .padding(.horizontal, 20)
                .frame(width: .screenWidth, alignment: .leading)
                .padding(.top, .topInsets + .screenWidth * 0.6)
                
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
        .onAppear {
            self.countryObj = Country(phoneCode: "82", isoCode: "KR")
        }
        .sheet(isPresented: $isShowCountryPicker, content: {
            CountryPickerUI(country: $countryObj)
        })
        .ignoresSafeArea()
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    SignInView()
}
