//
//  TextExtensions.swift
//  TinyCalender
//
//  Created by Zero IT Solutions on 05/01/23.
//  Copyright © 2023 Zero It Solutions. All rights reserved.
//


import SwiftUI

struct XelaDate {
    @Binding var theme_mode : Theme_mode
    var date: Date
    var xelaManager: XelaDateManager
    var isDisabled: Bool = false
    var isToday: Bool = false
    var isSelected: Bool = false
    var isBetweenStartAndEnd: Bool = false
    var year:String = ""
    var month:String = ""
    func getText() -> String {
        let day = formatDate(date: date, calendar: xelaManager.calendar)
        return day
    }
    
    func getMonth() -> Int {
        return Int(month) ?? 0
    }

    func getYear() -> Int {
        return Int(year) ?? 0
    }
    
    func getTextColor() -> Color {
        var textColor = xelaManager.colors.textColor
        if isDisabled {
            textColor = theme_mode == .light ?  .app_Black : .app_white
        } else if isSelected {
       //     textColor = xelaManager.colors.selectedColor
            textColor = theme_mode == .light ? .app_white : .app_white
            return textColor

        } else if isToday {
            textColor = theme_mode == .light ? .app_Black : .app_white
        } else if isBetweenStartAndEnd {
            textColor = theme_mode == .light ? .app_Black : .app_white
           // textColor = xelaManager.colors.betweenStartAndEndColor
        }
        textColor = theme_mode == .light ? .app_Black : .app_white
        return textColor
    }

    func getBackgroundColor() -> Color {
        var backgroundColor = xelaManager.colors.textBackgroundColor
        if isBetweenStartAndEnd {
            backgroundColor = xelaManager.colors.betweenStartAndEndBackgroundColor
        }
        if isToday {
            backgroundColor = xelaManager.colors.todayBackgroundColor
        }
        if isDisabled {
            backgroundColor = xelaManager.colors.disabledBackgroundColor
        }
        if isSelected {
            backgroundColor = theme_mode == .light ? xelaManager.colors.selectedBackgroundColor : .app_pink_color
  
        }
        return backgroundColor
    }

    func getChangeMonthBackgroundColor() -> Color {
        return xelaManager.colors.changeMonthButtonBackground
    }

    func getChangeMonthForegroundColor() -> Color {
        return xelaManager.colors.changeMonthButtonForeground
    }

    func formatDate(date: Date, calendar: Calendar) -> String {
        let formatter = dateFormatter()
        return stringFrom(date: date, formatter: formatter, calendar: calendar)
    }

    func dateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "d"
        return formatter
    }

    func stringFrom(date: Date, formatter: DateFormatter, calendar: Calendar) -> String {
        if formatter.calendar != calendar {
            formatter.calendar = calendar
        }
        return formatter.string(from: date)
    }
}
