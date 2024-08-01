//
//  WelcomeView.swift
//  shopping
//
//  Created by CHOI on 7/31/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Image("welcom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            
            VStack {
                Spacer()
                
                Image("app_logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 8)
                
                Text("환영합니다")
                    .font(.customfont(.semibold, fontSize: 48))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text("쉽고 간편하게 식품을 집까지 받아보세요")
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                NavigationLink {
                    SignInView()
                } label: {
                    RoundButton(title: "시작하기") {
                        
                    }
                }
                
                Spacer()
                    .frame(height: 80)
            }
            .padding(.horizontal, 20)
        }
        .ignoresSafeArea()
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    NavigationView {
        WelcomeView()
    }
}
