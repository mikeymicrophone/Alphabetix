//
//  ContentView.swift
//  Apphabetix Watch App
//
//  Created by Zero IT Solutions on 09/01/23.
//  Copyright © 2023 Zero It Solutions. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            VStack {
                Image(uiImage: #imageLiteral(resourceName: "calendar.png"))
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding(.top, 10)
                    .foregroundColor(.accentColor)
                VStack{
                    Text("Today is Day \(DateTime().letterOfDay())")
                        .font(.system(.title3))
                        .padding(.top, 10)
                        .foregroundColor(.black)
                }
            }
            .padding(.top, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
