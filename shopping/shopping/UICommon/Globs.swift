//
//  Globs.swift
//  shopping
//
//  Created by CHOI on 8/1/24.
//

import SwiftUI

struct Globs {
    static let AppName      = ""
    
    static let BASE_URL     = "http://localhost:50003/api/"
    
    static let USER_INFO    = "USER_INFO"
    static let IS_LOGIN     = "IS_LOGIN"
    
    static let URL_LOGIN    = BASE_URL + "user.login"
    static let URL_SIGNUP   = BASE_URL + "user.register"
}

struct KKey {
    static let RESULT   = "result"
    static let DATA     = "data"
    static let STATUS   = "status"
    static let MESSAGE  = "message"
    static let PAYLOAD  = "payload"
}

enum ResponseStatus: String {
    case SUCCESS = "1"
    case ERROR = "2"
}

class Utils {
    class func setUserDefault(key: String, data: Any) {
        UserDefaults.standard.set(data, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func removeUserDefault(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func getUserDefaultObject(key: String) -> Any {
        return UserDefaults.standard.value(forKey: key) as Any
    }
    
    class func getUserDefaultBoolean(key: String) -> Bool {
        return UserDefaults.standard.value(forKey: key) as? Bool ?? false
    }
}
