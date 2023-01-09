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
        minimumDate: Date().addingTimeInterval(60*60*24*(-370)),
        maximumDate: Date().addingTimeInterval(60*60*24*1460),
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
                    }
                    VStack {
                        Image(uiImage: #imageLiteral(resourceName: "calendar.png"))
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .padding(.top, 10)
                            .foregroundColor(.accentColor)
                        VStack{
                            Text("Today’s letter")
                                .font(.system(.title).bold())
                            Text("\(DateTime().letterOfDay())")
                                .font(.system(.largeTitle).bold())
                        }
                    }
                    .padding(.top, -70)
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
