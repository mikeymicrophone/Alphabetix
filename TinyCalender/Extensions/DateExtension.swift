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
}
