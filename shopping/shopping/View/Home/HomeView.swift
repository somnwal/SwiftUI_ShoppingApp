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
                        
                        ForEach( homeVM.offerArr, id: \.id) { obj in
                            ProductCell(obj: obj) {
                                
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
                        
                        ForEach( homeVM.bestArr, id: \.id) { obj in
                            ProductCell(obj: obj) {
                                
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
                        ForEach( homeVM.typeArr, id: \.id) { obj in
                            CategoryCell(obj: obj) {
                                
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach(homeVM.listArr, id: \.id) { obj in
                            ProductCell(obj: obj) {
                                
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                }
                .padding(.bottom, 30)
            }
        }
        .alert(isPresented: $homeVM.showError) {
            Alert(title: Text("알림"), message: Text(homeVM.errorMessage), dismissButton: .default(Text("확인")))
        }
        .ignoresSafeArea()
        .padding(.bottom, .bottomInsets * 2)
    }
}

#Preview {
    HomeView()
}
