//
//  HomeViewModel.swift
//  shopping
//
//  Created by CHOI on 8/1/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    static var shared: HomeViewModel = HomeViewModel()
    
    @Published var selectedTab: Int = 0
    @Published var txtSearch: String = ""
    
    
}
