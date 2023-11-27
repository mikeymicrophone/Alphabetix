//
//  TextExtensions.swift
//  TinyCalender
//
//  Created by Zero IT Solutions on 05/01/23.
//  Copyright © 2023 Zero It Solutions. All rights reserved.
//


import SwiftUI
import Foundation

struct XelaMonth: View {
    
    @Binding var theme_mode : Theme_mode
    @State var showPicker = false
    @State var selectedLetter = Letter().getLetter()
    @State private var selectedYear = ""
    @State private var selectedMonth = ""
    @ObservedObject var xelaManager: XelaDateManager
    @State private var state: XelaButtonState = .Hover
    @State var monthOffset: Int
    @State private var totalOffsets: Int = 0
    @State private var prevMonth: Int = 0
    @State private var prevYear: Int = 0
    @State private var yearClicked: Bool = false
    @State private var monthClicked: Bool = false
    @Binding var isPromtMessage : Bool
    
    var themeColor : Color{
        return theme_mode == .dark ? .app_white : .app_Black
    }
    
    var backGround_color : Color{
        return theme_mode == .dark ? .app_Black : .app_white
    }
    
    var selected_color : Color{
        return theme_mode == .dark ? .app_pink_color : .app_blue
    }


    let calendarUnitYMD = Set<Calendar.Component>([.year, .month, .day])
    let daysPerWeek = 7
//  let cellWidth = CGFloat(40)
    var monthsArray: [[Date]] {
        monthArray()
    }

    var body: some View {
        if yearClicked {
            VStack {
                Picker("", selection: $selectedYear) {
                    ForEach(years, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.inline)
                Button (action: {
                    yearClicked =  false
                    getnumberOfMonths(year: selectedYear)
                }, label: {
                    HStack {
                        Text("Apply \(selectedYear)")
                            .bold()
                            .foregroundColor(themeColor)
                    }.padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                        ).foregroundColor(themeColor)
                })
                
                Button (action: {
                    yearClicked = false
                    selectedYear = String(prevYear)
                }, label: {
                    HStack {
                        Text("Dismiss")
                            .bold()
                            .foregroundColor(themeColor)
                    }.padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                        ).foregroundColor(themeColor)
                })
            }
            
        } else if monthClicked {
            VStack {
                Picker("", selection: $selectedMonth) {
                    ForEach(months, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.inline)
                Button (action: {
                    monthClicked = false
                    if Int(getMonthHeader(true)) ?? 0 < (Int(getMonth(selectedMonth)) ?? 0){
                        let backMon = (Int(getMonth(selectedMonth)) ?? 0) - (Int(getMonthHeader(true)) ?? 0)
                        monthOffset += backMon
                        prevMonth = ((Int(getMonth(selectedMonth)) ?? 0) - 1)
                    } else if Int(getMonthHeader(true)) ?? 0 > (Int(getMonth(selectedMonth)) ?? 0) {
                        monthOffset -= prevMonth
                        monthOffset += (Int(getMonth(selectedMonth)) ?? 0)
                        monthOffset -= 1
                        prevMonth = (Int(getMonth(selectedMonth)) ?? 0)
                    }
                }, label: {
                    HStack {
                        Text("Apply \(selectedMonth)")
                            .bold()
                            .foregroundColor(themeColor)
                    }.padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                        ).foregroundColor(themeColor)
                })
                
                Button (action: {
                    monthClicked = false
                    selectedMonth = getMonthHeader(false)
                }, label: {
                    HStack {
                        Text("Dismiss")
                            .bold()
                            .foregroundColor(themeColor)
                    }.padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                        ).foregroundColor(themeColor)
                })
            }
        } else {
            VStack(alignment: HorizontalAlignment.center, spacing: 0) {
                if monthOffset != ((12 * (Date.getCurrentYear() - 2020)) + Date.getCurrentMonth() - 1) {
                    VStack {
                        Button(action: {
                            monthOffset = ((12 * (Date.getCurrentYear() - 2020)) + Date.getCurrentMonth() - 1)
                            prevYear = Date.getCurrentYear()
                        }) {
                            HStack {
                                Text("Back to Now")
                                    .foregroundColor(selected_color)
                                    .bold()
                                    
                            }.padding(10.0)
                                .sheet(isPresented: $showPicker) {
                                    letterPickerView(theme_mode: $theme_mode, isPromtMessage: $isPromtMessage, filter: $selectedLetter)
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(lineWidth: 2.0 )
                                        .foregroundColor(selected_color)
                                )
                        }
                    }.padding(.top, -40)
                        .padding(.bottom, 10)
                }
        
                HStack {
                    Button (action: {
                        yearClicked.toggle()
                    }, label: {
                        Text(getYearHeader())
                            .xelaHeadline()
                            //.foregroundColor(self.xelaManager.colors.yearHeaderColor)
                            .foregroundColor(themeColor)

                    })
                    
                    Button (action: {
                        monthClicked = true
                        selectedMonth = "January"
                        
                    }, label: {
                        Text(getMonthHeader(false))
                            .xelaHeadline()
                           // .foregroundColor(self.xelaManager.colors.monthHeaderColor)
                            .foregroundColor(themeColor.opacity(0.5))

                    })
                    Spacer()
                    XelaButton(theme_mode: $theme_mode, action: {
                        withAnimation { monthOffset -= 1 }
                        print(monthOffset)
                        selectedYear = getYearHeader()
                        totalOffsets = monthOffset
                        prevMonth = (Int(getMonthHeader(true)) ?? 0)
                        prevYear = Int(getYearHeader()) ?? 0
                    }, size: .Small, state: $state , type: .Secondary, background: xelaManager.colors.changeMonthButtonBackground, foregroundColor: Color.red , systemIcon: "chevron.left")
                    XelaButton(theme_mode: $theme_mode, action: { withAnimation { monthOffset += 1 }
                        selectedYear = getYearHeader()
                        print(monthOffset)
                        totalOffsets = monthOffset
                        prevMonth = (Int(getMonthHeader(true)) ?? 0)
                        prevYear = Int(getYearHeader()) ?? 0
                    } , size: .Small, state: $state, type: .Secondary, background: xelaManager.colors.changeMonthButtonBackground, foregroundColor: theme_mode == .light ? .black : .white , systemIcon: "chevron.right")
                }
                .frame(width: xelaManager.cellWidth * CGFloat(daysPerWeek))
                
                XelaDivider(style: .Dotted, color: xelaManager.colors.dividerColor)
                    .frame(width: xelaManager.cellWidth * CGFloat(daysPerWeek))
                    .padding(.vertical, 16)
                
                XelaWeekdayHeader(xelaManager: xelaManager)
                
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(monthsArray, id: \.self) { row in
                        HStack(spacing: 0) {
                            ForEach(row, id: \.self) { column in
                                HStack(spacing: 0) {
                                    if self.isThisMonth(date: column) {
                                        XelaDatePickerCell(xelaDate: XelaDate(
                                            theme_mode: $theme_mode, date: column,
                                            xelaManager: self.xelaManager,
                                            isDisabled: !self.isEnabled(date: column),
                                            isToday: self.isToday(date: column),
                                            isSelected: self.isSpecialDate(date: column),
                                            isBetweenStartAndEnd: self.isBetweenStartAndEnd(date: column),
                                            year: getYearHeader(),
                                            month: getMonthHeader(true)
                                        ), theme_mode: $theme_mode,
                                                           cellWidth: xelaManager.cellWidth)
                                        .onTapGesture { self.dateTapped(date: column) }
                                    } else {
                                        XelaDatePickerCell(xelaDate: XelaDate(
                                            theme_mode: $theme_mode, date: column,
                                            xelaManager: self.xelaManager,
                                            isDisabled: true,
                                            isToday: false,
                                            isSelected: false,
                                            isBetweenStartAndEnd: false
                                        ), theme_mode: $theme_mode
                                        )
                                    }
                                }
                            }
                        }
                    }
                    Spacer()
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: xelaManager.cellWidth * 7)
                
            }.background(xelaManager.colors.monthBackgroundColor)
            Button(action: {
             //   if UserDefaults.standard.value(forKey: "powerLetter") == nil {
                    self.showPicker.toggle()
               // }
            }) {
                HStack {
                    Text("\(selectedLetter.format) \(selectedLetter.letter)")
                            .bold()
                            .foregroundColor(selected_color)
                }.padding(10.0)
                    .sheet(isPresented: $showPicker) {
                        letterPickerView(theme_mode: $theme_mode, isPromtMessage: $isPromtMessage, filter: $selectedLetter)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                            .foregroundColor(selected_color)
                    )
            }.padding(.top, -35)
            
            VStack {
                Text("Today is Day \(DateTime().letterOfDay())")
                    .font(.system(.title).bold())
                    .foregroundColor(themeColor)
                    .colorScheme(.dark) //
            }.padding(.top, -20)
                .onAppear(perform: {
                    if totalOffsets == 0 {
                        totalOffsets = monthOffset
                        selectedYear = getYearHeader()
                        prevYear = Int(getYearHeader()) ?? 0
                    }
                })
        }
    }
        
    func getnumberOfMonths(year: String){
        if Int(year) == Date.getCurrentYear() {
            monthOffset = ((12 * (Date.getCurrentYear() - 2020)) + Date.getCurrentMonth() - 1)
            prevYear = Int(year) ?? 0
        } else if (Int(year) ?? 0) > Date.getCurrentYear() {
            
            let totalYears = (Int(year) ?? 0) - prevYear
            monthOffset += (totalYears * 12)
            
            prevYear = Int(year) ?? 0
        } else if (Int(year) ?? 0) < Date.getCurrentYear() {
            
            
            let totalYears = prevYear - (Int(year) ?? 0)
            
            monthOffset -= (totalYears * 12)
            if monthOffset < (totalYears * 12) {
                
            }
            prevYear = (Int(year) ?? 0)
        }
    }
    
    func getMonth(_ mon: String) -> String {
        let numericmonth = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
        for (index, element) in months.enumerated() {
            if mon == element {
                return String(numericmonth[index])
            }
        }
        return ""
    }

    func isThisMonth(date: Date) -> Bool {
        return xelaManager.calendar.isDate(date, equalTo: firstOfMonthForOffset(), toGranularity: .month)
    }

    func dateTapped(date: Date) {
        if isEnabled(date: date) {
            switch xelaManager.mode {
            case 0:
                if xelaManager.selectedDate != nil,
                   xelaManager.calendar.isDate(xelaManager.selectedDate, inSameDayAs: date)
                {
                    xelaManager.selectedDate = nil
                } else {
                    xelaManager.selectedDate = date
                }

            case 1:
                xelaManager.startDate = date
                xelaManager.endDate = nil
                xelaManager.mode = 2
            case 2:
                xelaManager.endDate = date
                if isStartDateAfterEndDate() {
                    xelaManager.endDate = nil
                    xelaManager.startDate = nil
                }
                xelaManager.mode = 1
            case 3:
                if xelaManager.selectedDatesContains(date: date) {
                    if let ndx = xelaManager.selectedDatesFindIndex(date: date) {
                        xelaManager.selectedDates.remove(at: ndx)
                    }
                } else {
                    xelaManager.selectedDates.append(date)
                }
            default:
                xelaManager.selectedDate = date
            }
        }
    }

    func monthArray() -> [[Date]] {
        var rowArray = [[Date]]()
        for row in 0 ..< (numberOfDays(offset: monthOffset) / 7) {
            var columnArray = [Date]()
            for column in 0 ... 6 {
                let abc = getDateAtIndex(index: (row * 7) + column)
                columnArray.append(abc)
            }
            rowArray.append(columnArray)
        }
        return rowArray
    }

    func getYearHeader() -> String {
        let headerDateFormatter = DateFormatter()
        headerDateFormatter.calendar = xelaManager.calendar
        headerDateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy", options: 0, locale: xelaManager.calendar.locale)

        return headerDateFormatter.string(from: firstOfMonthForOffset())
    }

    func getMonthHeader(_ inNumFormat:Bool) -> String {
        let headerDateFormatter = DateFormatter()
        headerDateFormatter.calendar = xelaManager.calendar
        
        headerDateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: inNumFormat == true ? "MM" : "LLLL" , options: 0, locale: xelaManager.calendar.locale)

        return headerDateFormatter.string(from: firstOfMonthForOffset())
    }

    func getDateAtIndex(index: Int) -> Date {
        let firstOfMonth = firstOfMonthForOffset()
        let weekday = xelaManager.calendar.component(.weekday, from: firstOfMonth)
        var startOffset = weekday - xelaManager.calendar.firstWeekday
        startOffset += startOffset >= 0 ? 0 : daysPerWeek
        var dateComponents = DateComponents()
        dateComponents.day = index - startOffset

        return xelaManager.calendar.date(byAdding: dateComponents, to: firstOfMonth)!
    }

    func numberOfDays(offset _: Int) -> Int {
        let firstOfMonth = firstOfMonthForOffset()
        let rangeOfWeeks = xelaManager.calendar.range(of: .weekOfMonth, in: .month, for: firstOfMonth)

        return (rangeOfWeeks?.count)! * daysPerWeek
    }

    func firstOfMonthForOffset() -> Date {
        var offset = DateComponents()
        offset.month = monthOffset

        return xelaManager.calendar.date(byAdding: offset, to: XelaFirstDateMonth())!
    }

    func XelaFormatDate(date: Date) -> Date {
        let components = xelaManager.calendar.dateComponents(calendarUnitYMD, from: date)

        return xelaManager.calendar.date(from: components)!
    }

    func XelaFormatAndCompareDate(date: Date, referenceDate: Date) -> Bool {
        let refDate = XelaFormatDate(date: referenceDate)
        let clampedDate = XelaFormatDate(date: date)
        return refDate == clampedDate
    }

    func XelaFirstDateMonth() -> Date {
        var components = xelaManager.calendar.dateComponents(calendarUnitYMD, from: xelaManager.minimumDate)
        components.day = 1

        return xelaManager.calendar.date(from: components)!
    }

    // MARK: - Date Property Checkers

    func isToday(date: Date) -> Bool {
        return XelaFormatAndCompareDate(date: date, referenceDate: Date())
    }

    func isSpecialDate(date: Date) -> Bool {
        return isSelectedDate(date: date) ||
            isStartDate(date: date) ||
            isEndDate(date: date) ||
            isOneOfSelectedDates(date: date)
    }

    func isOneOfSelectedDates(date: Date) -> Bool {
        return xelaManager.selectedDatesContains(date: date)
    }

    func isSelectedDate(date: Date) -> Bool {
        if xelaManager.selectedDate == nil {
            return false
        }
        return XelaFormatAndCompareDate(date: date, referenceDate: xelaManager.selectedDate)
    }

    func isStartDate(date: Date) -> Bool {
        if xelaManager.startDate == nil {
            return false
        }
        return XelaFormatAndCompareDate(date: date, referenceDate: xelaManager.startDate)
    }

    func isEndDate(date: Date) -> Bool {
        if xelaManager.endDate == nil {
            return false
        }
        return XelaFormatAndCompareDate(date: date, referenceDate: xelaManager.endDate)
    }

    func isBetweenStartAndEnd(date: Date) -> Bool {
        if xelaManager.startDate == nil {
            return false
        } else if xelaManager.endDate == nil {
            return false
        } else if xelaManager.calendar.compare(date, to: xelaManager.startDate, toGranularity: .day) == .orderedAscending {
            return false
        } else if xelaManager.calendar.compare(date, to: xelaManager.endDate, toGranularity: .day) == .orderedDescending {
            return false
        }
        return true
    }

    func isOneOfDisabledDates(date: Date) -> Bool {
        return xelaManager.disabledDatesContains(date: date)
    }

    func isEnabled(date: Date) -> Bool {
        let clampedDate = XelaFormatDate(date: date)
        if xelaManager.calendar.compare(clampedDate, to: xelaManager.minimumDate, toGranularity: .day) == .orderedAscending || xelaManager.calendar.compare(clampedDate, to: xelaManager.maximumDate, toGranularity: .day) == .orderedDescending {
            return false
        }
        return !isOneOfDisabledDates(date: date)
    }

    func isStartDateAfterEndDate() -> Bool {
        if xelaManager.startDate == nil {
            return false
        } else if xelaManager.endDate == nil {
            return false
        } else if xelaManager.calendar.compare(xelaManager.endDate, to: xelaManager.startDate, toGranularity: .day) == .orderedDescending {
            return false
        }
        return true
    }
}

struct XelaLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
