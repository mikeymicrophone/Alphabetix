//
//  PromptMessage.swift
//  Alphabetix
//
//  Created by Taimur imam on 19/10/23.
//  Copyright © 2023 Zero It Solutions. All rights reserved.

import SwiftUI

struct PromptMessage: View {
    @Binding var theeme_mode : Theem_mode
    @Binding var isDisplay : Bool
    var themeColor : Color{
        return theeme_mode == .dark ? .app_white : .app_Black
    }
    var backGround_color : Color{
        return theeme_mode == .dark ? .app_Black : .app_white
    }
    
    var body: some View {
        VStack{
            Text("Your power letter isn't the letter of the day")
                .font(.system(.title).bold())
                .foregroundColor(themeColor)
                .multilineTextAlignment(.center)
                .padding()
                .padding(.vertical)
        }
        .background(backGround_color)
        .cornerRadius(12)
        .shadow(color: themeColor.opacity(0.3), radius: 10)
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                withAnimation{
                    isDisplay.toggle()
                }
            }
        }
    }
}

#Preview {
    PromptMessage(theeme_mode: .constant(.dark), isDisplay: .constant(true))
}
