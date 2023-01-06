//
//  XelaColorSettings.swift
//  XelaExampleApp
//
//  Created by Zero IT Solutions on 02/01/23.
//  Copyright © 2023 Zero It Solutions. All rights reserved.
//

import SwiftUI
struct XelaColorSettings {
    // foreground colors
    @State var textColor: Color = .init(xelaColor: .Gray3)
    var todayColor: Color = .init(xelaColor: .Blue3)
    var selectedColor: Color = .init(.white)
    var disabledColor: Color = .init(xelaColor: .Gray9)
    var betweenStartAndEndColor: Color = .init(xelaColor: .Gray3)
    // background colors
    var textBackgroundColor: Color = .clear
    var todayBackgroundColor: Color = .init(.white)
    var selectedBackgroundColor: Color = .init(xelaColor: .Blue3)
    var disabledBackgroundColor: Color = .clear
    var betweenStartAndEndBackgroundColor: Color = .init(xelaColor: .Blue8)
    // headers foreground colors
    var weekdayHeaderColor: Color = .init(xelaColor: .Gray7)
    var monthHeaderColor: Color = .init(xelaColor: .Gray2)
    var yearHeaderColor: Color = .init(xelaColor: .Gray9)
    // headers background colors
    var weekdayHeaderBackgroundColor: Color = .clear
    var monthBackgroundColor: Color = .clear
    // next & prev button colors
    var changeMonthButtonBackground: Color = .init(.white)
    var changeMonthButtonForeground: Color = .init(xelaColor: .Gray3)

    var dividerColor: Color = .init(xelaColor: .Gray9)
}
