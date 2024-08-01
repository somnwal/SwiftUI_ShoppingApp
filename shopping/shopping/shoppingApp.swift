//
//  shoppingApp.swift
//  shopping
//
//  Created by CHOI on 7/30/24.
//

import SwiftUI

@main
struct shoppingApp: App {
    
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                
                if mainVM.isUserLogin {
                    MainTabView()
                } else {
                    WelcomeView()
                }
            }
        }
    }
}
