//
//  UserModel.swift
//  shopping
//
//  Created by CHOI on 8/1/24.
//

import SwiftUI

struct UserModel: Identifiable, Equatable {
    var id: Int = 0
    var username: String = ""
    var name: String = ""
    var mobile: String = ""
    var mobile_code: String = ""
    var auth_token: String = ""
    
    init(userInfo: NSDictionary) {
        self.id = userInfo.value(forKey: "user_id") as? Int ?? 0
        self.username = userInfo.value(forKey: "username") as? String ?? ""
        self.name = userInfo.value(forKey: "name") as? String ?? ""
        self.mobile = userInfo.value(forKey: "mobile") as? String ?? ""
        self.mobile_code = userInfo.value(forKey: "mobile_code") as? String ?? ""
        self.auth_token = userInfo.value(forKey: "auth_token") as? String ?? ""
    }
    
    static func == (a: UserModel, b: UserModel) -> Bool {
        return a.id == b.id
    }
}
