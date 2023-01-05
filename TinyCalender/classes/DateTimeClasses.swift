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
    
    func letterOfDays(_ date: Int) -> String {
        let letterList = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        var totalDays = 0
        let currentMonth = Date.getCurrentMonth() == 1 ? 1 : Date.getCurrentMonth() - 1
        var previousDays = 0
        let currentDate =  date  //Date.getCurrentDate()
        
        for numbers in 1...currentMonth  {
            let monthDays  = DateTime().getDaysInMonth(month: numbers, year: Date.getCurrentYear())
            totalDays += monthDays ?? 0
        }
        
        if Date.getCurrentMonth() == 1 {
            if currentDate < 26 {
                previousDays = currentDate + DateTime().prevYearDays()
            } else {
                previousDays = (currentDate - 26) + DateTime().prevYearDays()
            }
        } else {
            previousDays = totalDays + currentDate + DateTime().prevYearDays()
        }
        
        let letterGroups = previousDays/26
        let totalFinalDays = letterGroups * 26
        let finalLetter = previousDays-totalFinalDays
        
        if finalLetter-1 <= -1 {
            return letterList.last ?? ""
        }
          
        return letterList[finalLetter-1]
    }
    
}
