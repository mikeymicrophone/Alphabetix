//
//  XelaDateManager.swift
//  XelaExampleApp
//
//  Created by Zero IT Solutions on 02/01/23.
//  Copyright © 2023 Zero It Solutions. All rights reserved.
//

import SwiftUI

class XelaDateManager: ObservableObject {
    @Published var calendar = Calendar.current
    @Published var minimumDate: Date = .init()
    @Published var maximumDate: Date = .init()
    @Published var disabledDates: [Date] = .init()
    @Published var selectedDates: [Date] = .init()
    @Published var selectedDate: Date! = nil
    @Published var startDate: Date! = nil
    @Published var endDate: Date! = nil

    @Published var mode: Int = 0

    @Published var colors = XelaColorSettings()
    var cellWidth: CGFloat = 40

    init(calendar: Calendar, minimumDate: Date, maximumDate: Date, disabledDates: [Date] = [Date](), selectedDate: Date? = nil, selectedDates: [Date] = [Date](), mode: Int, colors: XelaColorSettings = XelaColorSettings(), cellWidth: CGFloat = 40) {
        self.calendar = calendar
        self.minimumDate = minimumDate
        self.maximumDate = maximumDate
        self.disabledDates = disabledDates
        self.selectedDate = selectedDate
        self.selectedDates = selectedDates
        self.mode = mode
        self.colors = colors
        self.cellWidth = cellWidth
    }

    func selectedDatesContains(date: Date) -> Bool {
        if let _ = selectedDates.first(where: { calendar.isDate($0, inSameDayAs: date) }) {
            return true
        }
        return false
    }

    func selectedDatesFindIndex(date: Date) -> Int? {
        return selectedDates.firstIndex(where: { calendar.isDate($0, inSameDayAs: date) })
    }

    func disabledDatesContains(date: Date) -> Bool {
        if let _ = disabledDates.first(where: { calendar.isDate($0, inSameDayAs: date) }) {
            return true
        }
        return false
    }

    func disabledDatesFindIndex(date: Date) -> Int? {
        return disabledDates.firstIndex(where: { calendar.isDate($0, inSameDayAs: date) })
    }
}
