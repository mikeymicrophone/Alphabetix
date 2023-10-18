//
//  ContentView.swift
//  TinyCalender
//
//  Created by Zero IT Solutions on 02/01/23.
//


import SwiftUI
enum Theem_mode : Int{
    case dark = 0
    case lite
}

struct ContentView: View {
    @State var theem_mode = Theem_mode.lite
    @State var showPicker = false
    @State var selectedLetter = Letter().getLetter()
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
                if theem_mode == .dark{
                    Color.black.ignoresSafeArea()
                }else{
                    Color.white.ignoresSafeArea()
                }           
                ScrollView(.vertical){
                    VStack {
                        XelaDatePicker(theeme_mode: $theem_mode, xelaDateManager: xelaDateManager, monthOffset: ((12 * (Date.getCurrentYear() - 2020)) + Date.getCurrentMonth() - 1 ))
                            .padding(.top, 40)
                    }
                }
            }
            .navigationTitle("Alphabetix")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
             Button{
                withAnimation{
                    theem_mode = theem_mode == .dark ? .lite : .dark
                }
            }label: {
                Image( theem_mode == .lite ? "dark" : "lite")
            }
            ).navigationBarBackButtonHidden(true)
            .onAppear {
                UIApplication.shared.applicationIconBadgeNumber = 0
                //UserDefaults.standard.set(0, forKey: "NotificationBadgeCount")
                NotificationManager.instance.requestAuthorization()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Apply stack navigation view style

        // Set the navigation bar title color for both light and dark mode
        .onAppear {
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        }
        .preferredColorScheme(theem_mode == .lite ? .light : .dark) // Set the preferred color scheme to dark mode
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
