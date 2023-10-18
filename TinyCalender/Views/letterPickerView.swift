//
//  letterPickerView.swift
//  TinyCalender
//
//  Created by Zero IT Solutions on 11/01/23.
//  Copyright © 2023 Zero It Solutions. All rights reserved.
//

import SwiftUI

class Letter{
    func getLetter()->LetterModel{
        let word = Userdefaults().getSavesWord()
        return   LetterModel(format: "\(word != "+" ? "My " :"")Power Letter", letter: Userdefaults().getSavesWord())
    }
}

struct LetterModel {
    var format: String
    var letter: String
}

struct letterPickerView: View {
     var letterList = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    @State private var selectedLetter = "-"
    @Environment(\.presentationMode) var presentationMode
    @Binding var theeme_mode : Theem_mode
    var theem_color : Color{
        return theeme_mode == .dark ? .app_white : .app_Black
    }
    
    var backGround_color : Color{
        return theeme_mode == .dark ? .app_Black : .app_white
    }

    var onDismiss: ((_ model: LetterModel) -> Void)?
        @Binding var filter: LetterModel
    
    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Text("Dismiss")
                            .foregroundColor(theem_color)
                            .padding(.top, 15)
                            .padding(.trailing, -6)
                        Image(systemName: "xmark")
                            .foregroundColor(theem_color)
                            .padding(.top, 15)
                    }.padding()
                    
                }.padding(.top, 10)
                    .padding(.leading, 10)
                Spacer()
            }.padding(.top, -400)
            
            VStack {
                Text("What is your Power Letter?")
                    .xelaHeadline()
                    .padding(.bottom, -10)
                    .foregroundColor(theem_color)
                Picker("", selection: $selectedLetter) {
                    ForEach(letterList, id: \.self) {
                        Text($0)
                            .foregroundColor(theem_color)
                    }
                }.pickerStyle(.inline)
                
                Text("You selected \(selectedLetter)")
                    .bold()
                    .foregroundColor(theem_color)
                if selectedLetter != "-" {
                    Button(action: {
                        UserDefaults.standard.set(selectedLetter, forKey: "powerLetter")
                        print(UserDefaults.standard.value(forKey: "powerLetter") ?? String.self)
                        filter = LetterModel(format: "My Power Letter is ", letter: selectedLetter)
                        onDismiss?(filter)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Text("Save Letter \(selectedLetter)")
                                .bold()
                                .foregroundColor(theem_color)
                        }.padding(10.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(lineWidth: 2.0)
                            ).foregroundColor(theem_color)
                    }.padding(.top, 10)
                }
            }
        }
    }
    }
