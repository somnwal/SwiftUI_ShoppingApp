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
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var offerArr: [ProductModel] = []
    @Published var bestArr: [ProductModel] = []
    @Published var listArr: [ProductModel] = []
    @Published var typeArr: [TypeModel] = []
    
    init() {
        requestHome()
    }
    
    // MARK: 홈 화면 불러오기
    func requestHome() {
        
        ServiceCall.post(parameter: [:], url: Globs.URL_HOME, isToken: true) { response in
            if let response = response as? NSDictionary {
                let status = response.value(forKey: KKey.STATUS) as? String ?? ""
                let message = response.value(forKey: KKey.MESSAGE) as? String ?? ""
                let payload = response.value(forKey: KKey.PAYLOAD) as? NSDictionary ?? [:]
                
                
                if status == ResponseStatus.SUCCESS.rawValue {
                    
                    self.offerArr = (payload.value(forKey: "offer_list") as? NSArray ?? []).map({ obj in
                        return ProductModel(productInfo: obj as? NSDictionary ?? [:])
                    })
                    
                    self.bestArr = (payload.value(forKey: "best_sell_list") as? NSArray ?? []).map({ obj in
                        return ProductModel(productInfo: obj as? NSDictionary ?? [:])
                    })
                    
                    self.listArr = (payload.value(forKey: "list") as? NSArray ?? []).map({ obj in
                        return ProductModel(productInfo: obj as? NSDictionary ?? [:])
                    })
                    
                    self.typeArr = (payload.value(forKey: "type_list") as? NSArray ?? []).map({ obj in
                        return TypeModel(typeInfo: obj as? NSDictionary ?? [:])
                    })
                } else {
                    self.errorMessage = message
                    self.showError = true
                }
            }
        } onFailure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
}
