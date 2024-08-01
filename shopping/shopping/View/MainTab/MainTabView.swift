//
//  MainTabView.swift
//  shopping
//
//  Created by CHOI on 8/1/24.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var homeVM = HomeViewModel.shared
    
    var body: some View {
        VStack {
            TabView(selection: $homeVM.selectedTab) {
                HomeView().tag(0)
                ExploreView().tag(1)
                ExploreView().tag(2)
                ExploreView().tag(3)
                ExploreView().tag(4)
            }
//            .onAppear {
//                UIScrollView.appearance().isScrollEnabled = false
//            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onChange(of: homeVM.selectedTab) { newValue in
                
            }
            
            HStack {
                TabButton(title: "상품", icon: "store_tab", isSelected: homeVM.selectedTab == 0) {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selectedTab = 0
                        }
                    }
                }
                
                TabButton(title: "탐색", icon: "explore_tab", isSelected: homeVM.selectedTab == 1) {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selectedTab = 1
                        }
                    }
                }
                
                TabButton(title: "장바구니", icon: "cart_tab", isSelected: homeVM.selectedTab == 2) {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selectedTab = 2
                        }
                    }
                }
                
                TabButton(title: "관심", icon: "fav_tab", isSelected: homeVM.selectedTab == 3) {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selectedTab = 3
                        }
                    }
                }
                
                TabButton(title: "계정", icon: "account_tab", isSelected: homeVM.selectedTab == 4) {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selectedTab = 4
                        }
                    }
                }
            }
            .padding(.top, 10)
            .padding(.bottom, .bottomInsets)
            .padding(.horizontal, 10)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: -2)
        }
        .ignoresSafeArea()
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    MainTabView()
}
