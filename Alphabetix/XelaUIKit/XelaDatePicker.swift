//
//  TextExtensions.swift
//  TinyCalender
//
//  Created by Zero IT Solutions on 05/01/23.
//  Copyright © 2023 Zero It Solutions. All rights reserved.
//


import SwiftUI

struct XelaDatePicker: View {
    @Binding var theme_mode : Theme_mode
    @ObservedObject var xelaDateManager: XelaDateManager
    @Binding var isPromptMessage : Bool
    var monthOffset = 0
    var body: some View {
        XelaMonth(theme_mode: $theme_mode, xelaManager: xelaDateManager, monthOffset: monthOffset, isPromtMessage: $isPromptMessage)
    }
}
