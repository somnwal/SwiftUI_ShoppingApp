//
//  UIKitExtension.swift
//  shopping
//
//  Created by CHOI on 8/1/24.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailRegExp = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegExp)
        
        return emailTest.evaluate(with: self)
    }
}
