//
//  TextExtensions.swift
//  TinyCalender
//
//  Created by Zero IT Solutions on 05/01/23.
//  Copyright © 2023 Zero It Solutions. All rights reserved.
//


import SwiftUI

struct XelaDatePicker: View {
    @Binding var theeme_mode : Theem_mode
    @ObservedObject var xelaDateManager: XelaDateManager
    var monthOffset = 0
    var body: some View {
        XelaMonth(theeme_mode: $theeme_mode, xelaManager: xelaDateManager, monthOffset: monthOffset)
    }
}
