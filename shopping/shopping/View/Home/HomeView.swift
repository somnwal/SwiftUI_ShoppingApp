//
//  HomeView.swift
//  shopping
//
//  Created by CHOI on 8/1/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeVM = HomeViewModel.shared
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    SearchTextField(txt: $homeVM.txtSearch, placeholder: "상품 찾아보기")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                }
                .padding(.top, .topInsets)
                
                Image("banner_top")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 115)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                
                SectionTitle(title: "특가 상품", viewAllText: "더보기") {
                    
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach( 0 ... 5, id: \.self) { index in
                            ProductCell {
                                
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                }
                .padding(.bottom, 15)
                
                SectionTitle(title: "베스트 셀러", viewAllText: "더보기") {
                    
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach( 0 ... 5, id: \.self) { index in
                            ProductCell {
                                
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                }
                .padding(.bottom, 15)
                
                SectionTitle(title: "신선 식품", viewAllText: "더보기") {
                    
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach( 0 ... 5, id: \.self) { index in
                            CategoryCell(color: Color(hex: "F8A44C")) {
                                
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach( 0 ... 5, id: \.self) { index in
                            ProductCell {
                                
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                }
                .padding(.bottom, 15)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
