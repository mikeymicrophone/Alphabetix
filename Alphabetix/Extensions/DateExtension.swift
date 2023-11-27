//
//  DateExtension.swift
//  TinyCalender
//
//  Created by Zero IT Solutions on 02/01/23.
//  Copyright © 2023 Zero It Solutions. All rights reserved.
//

import Foundation

extension Date {
    
    static func getCurrentDate() -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let currentDate = dateFormatter.string(from: Date())
        return Int(currentDate) ?? 0
    }
    
    static func getCurrentYear() -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let currentYear = dateFormatter.string(from: Date())
        return Int(currentYear) ?? 0
    }
    
    static func getCurrentMonth() -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        let currentMonth = dateFormatter.string(from: Date())
        return Int(currentMonth) ?? 0
    }
    
    static func getCurrentTime() -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        let currentMonth = dateFormatter.string(from: Date())
        return Int(currentMonth) ?? 0
    }
    
    func getMinDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: "2020-01-01 10:02:44 +0000") // replace Date String
    }
}
