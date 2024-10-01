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
    
    func toDate(format: String = "yyyy-MM-dd'T'HH:mm:ss.SSS") -> Date? {
        let dateFormat = DateFormatter()
        
        dateFormat.dateFormat = format
        
        return dateFormat.date(from: self)
    }
    
    func toDateFormatString(format: String = "yyyy-MM-dd'T'HH:mm:ss.SSS", newFormat: String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        
        if let dt = dateFormat.date(from: self) {
            dateFormat.dateFormat = newFormat
            return dateFormat.string(from: dt)
        } else {
            return ""
        }
    }
}

extension Date {
    func displayDate(format: String, addMinTime: Int = 0) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        
        let date = self.addingTimeInterval(TimeInterval(60 * addMinTime))
        
        return dateFormat.string(from: date)
    }
}
