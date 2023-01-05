//
//  ContentView.swift
//  TinyCalender
//
//  Created by Zero IT Solutions on 02/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.brown.ignoresSafeArea()
            VStack {
                Image(uiImage: #imageLiteral(resourceName: "calendar.png"))
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .padding(.top, 10)
                    .foregroundColor(.accentColor)
                VStack{
                    Text("Today’s letter")
                        .font(.system(.title).bold())
                        .padding(.top, 10)
                    Text("\(todayWord())")
                        .font(.system(.largeTitle).bold())
                }
            }
            .padding(.top, 10)
        }
    }
    
    func todayWord() -> String {
        let characters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        var totalDays = 0
        let currentMonth = Date.getCurrentMonth() == 1 ? 1 : Date.getCurrentMonth() - 1
        var previousDays = 0
        let currentDate =  Date.getCurrentDate()
        
        for numbers in  1...currentMonth  {
            let currr  = DateTime().getDaysInMonth(month: numbers, year: Date.getCurrentYear())
            totalDays += currr ?? 0
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
        
        let ddd = previousDays/26
        let kk = ddd * 26
        let finalWord = previousDays-kk
        return characters[finalWord-1]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
