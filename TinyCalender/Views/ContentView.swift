//
//  ContentView.swift
//  TinyCalender
//
//  Created by Zero IT Solutions on 02/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var showPicker = false
    @State var selectedLetter = LetterModel(format: "Power Letter", letter: "+")
    @StateObject var xelaDateManager:XelaDateManager = XelaDateManager(
        calendar: Calendar.current,
        minimumDate: Date().getMinDate()!,
        maximumDate: Date().addingTimeInterval(60*60*24*50000),
        selectedDate: Date.now,
        mode: 0,
        colors: XelaColorSettings(),
        cellWidth: 50
    )
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.ignoresSafeArea()
                ScrollView(.vertical){
                    VStack {
                        XelaDatePicker(xelaDateManager: xelaDateManager, monthOffset: ((12 * (Date.getCurrentYear() - 2020)) + Date.getCurrentMonth() - 1 ))
                            .padding(.top, 40)
                    }
                }
            }.navigationTitle("Alphabetix Magicalendar")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    UIApplication.shared.applicationIconBadgeNumber = 0
                    //UserDefaults.standard.set(0, forKey: "NotificationBadgeCount")
                    NotificationManager.instance.requestAuthorization()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
