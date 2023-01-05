//
//  DateClasses.swift
//  TinyCalender
//
//  Created by Zero IT Solutions on 02/01/23.
//  Copyright © 2023 Zero It Solutions. All rights reserved.
//

import Foundation

public class DateTime: NSObject {
    
    public func getDaysInMonth(month: Int, year: Int) -> Int? {
        let calendar = Calendar.current
        var startComps = DateComponents()
        startComps.day = 1
        startComps.month = month
        startComps.year = year
        
        var endComps = DateComponents()
        endComps.day = 1
        endComps.month = month == 12 ? 1 : month + 1
        endComps.year = month == 12 ? year + 1 : year
        
        let startDate = calendar.date(from: startComps)!
        let endDate = calendar.date(from:endComps)!
        
        let diff = calendar.dateComponents([Calendar.Component.day], from: startDate, to: endDate)
        return diff.day
    }
    
    public func totalDaysInYear(year: Int)-> Int {
        
        if year % 400 == 0 || (year % 100 != 0 && year % 4 == 0){
            return 366
        } else {
            return 365
        }
    }
    
    func prevYearDays() -> Int {
        let currentYear = Date.getCurrentYear()
        var totalDays = 0
        let startYear = 2020
        let subyear = (currentYear) - startYear
        for year in 0...subyear - 1 {
            totalDays += totalDaysInYear(year: startYear+year)
        }
        return totalDays
    }
    
}
