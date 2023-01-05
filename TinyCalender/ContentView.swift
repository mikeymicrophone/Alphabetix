//
//  ContentView.swift
//  TinyCalender
//
//  Created by Zero IT Solutions on 02/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var xelaDateManager:XelaDateManager = XelaDateManager(
        calendar: Calendar.current,
        minimumDate: Date().addingTimeInterval(60*60*24*(-365)),
        maximumDate: Date().addingTimeInterval(60*60*24*365),
//        disabledDates: [Date().addingTimeInterval(60*60*24*(-3)), Date().addingTimeInterval(60*60*24*(10)), Date().addingTimeInterval(60*60*24*(-2))],
        //selectedDate: Date().addingTimeInterval(60*60*24*3),
        selectedDate: Date.now,
        mode: 0,
        colors: XelaColorSettings(),
        cellWidth: 50
    )
    
    var body: some View {
        NavigationView{
        ZStack {
            Color.white.ignoresSafeArea()
            ScrollView(.vertical){
                VStack {
                    XelaDatePicker(xelaDateManager: xelaDateManager, monthOffset: 12)
                        .padding(.top, 40)
                }//.padding(.top, -200)
                VStack {
                    Image(uiImage: #imageLiteral(resourceName: "calendar.png"))
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .padding(.top, 10)
                        .foregroundColor(.accentColor)
                    VStack{
                        Text("Today’s letter")
                            .font(.system(.title).bold())
                        Text("\(letterOfDay())")
                            .font(.system(.largeTitle).bold())
                    }
                }
                .padding(.top, -80)
            }
        }.navigationTitle("Apphabetix")
                .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    func letterOfDay() -> String {
        let letterList = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        var totalDays = 0
        let currentMonth = Date.getCurrentMonth() == 1 ? 1 : Date.getCurrentMonth() - 1
        var previousDays = 0
        let currentDate =  Date.getCurrentDate()
        
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
        return letterList[finalLetter-1]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
