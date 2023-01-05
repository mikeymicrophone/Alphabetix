//
//  TextExtensions.swift
//  TinyCalender
//
//  Created by Zero IT Solutions on 05/01/23.
//  Copyright © 2023 Zero It Solutions. All rights reserved.
//


import SwiftUI

struct XelaWeekdayHeader: View {
    var xelaManager: XelaDateManager

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(self.getWeekdayHeaders(calendar: self.xelaManager.calendar), id: \.self) { weekday in
                Text(weekday)
                    .xelaCaption()
                    .frame(width: xelaManager.cellWidth, height: xelaManager.cellWidth)
                    .foregroundColor(self.xelaManager.colors.weekdayHeaderColor)
            }
        }.background(xelaManager.colors.weekdayHeaderBackgroundColor)
    }

    func getWeekdayHeaders(calendar: Calendar) -> [String] {
        let formatter = DateFormatter()

        var weekdaySymbols = formatter.shortStandaloneWeekdaySymbols
        let weekdaySymbolsCount = weekdaySymbols?.count ?? 0

        for _ in 0 ..< (1 - calendar.firstWeekday + weekdaySymbolsCount) {
            let lastObject = weekdaySymbols?.last
            weekdaySymbols?.removeLast()
            weekdaySymbols?.insert(lastObject!, at: 0)
        }

        return weekdaySymbols ?? []
    }
}
