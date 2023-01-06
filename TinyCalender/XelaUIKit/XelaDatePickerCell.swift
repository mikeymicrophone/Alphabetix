//
//  TextExtensions.swift
//  TinyCalender
//
//  Created by Zero IT Solutions on 05/01/23.
//  Copyright © 2023 Zero It Solutions. All rights reserved.
//


import SwiftUI

struct XelaDatePickerCell: View {
    var xelaDate: XelaDate

    var cellWidth: CGFloat = 40

    var borderLineWidth: CGFloat = 2

    var body: some View {
        if xelaDate.isDisabled {
            Text(xelaDate.getText())
                .xelaSmallBody()
                .foregroundColor(xelaDate.getTextColor())
                .frame(width: xelaDate.xelaManager.cellWidth, height: xelaDate.xelaManager.cellWidth)
                .background(xelaDate.getBackgroundColor())
                .cornerRadius(8)
        } else {
            //            ZStack {
            //                Rectangle()
            //                    .fill(xelaDate.getBackgroundColor())
            //                    .frame(width: xelaDate.xelaManager.cellWidth, height: xelaDate.xelaManager.cellWidth - 10)
            //                    .opacity(xelaDate.isBetweenStartAndEnd && !xelaDate.isSelected ? 1 : 0)
            //
            //                //Text(xelaDate.getText())
            //                Text(DateTime().letterOfDays(Int(xelaDate.getText())!))
            //                    .xelaButtonMedium()
            //                    .foregroundColor(xelaDate.getTextColor())
            //                    .frame(width: xelaDate.xelaManager.cellWidth, height: xelaDate.xelaManager.cellWidth)
            //                    .background(xelaDate.isBetweenStartAndEnd && !xelaDate.isSelected ? Color.clear : xelaDate.getBackgroundColor())
            //                    .cornerRadius(8)
            //                    .overlay(
            //                        RoundedRectangle(cornerRadius: 8)
            //                            .strokeBorder(xelaDate.getTextColor(), lineWidth: borderLineWidth)
            //                            .opacity(xelaDate.isToday && !xelaDate.isSelected ? 1 : 0)
            //                    )
            //            }
            ZStack {
                Rectangle()
                    .fill(xelaDate.getBackgroundColor())
                    .frame(width: xelaDate.xelaManager.cellWidth, height: xelaDate.xelaManager.cellWidth - 10)
                    .opacity(xelaDate.isBetweenStartAndEnd && !xelaDate.isSelected ? 1 : 0)
                    .padding(.leading,0.8)
                    .padding(.trailing,0.8)
                VStack {
                    Text(xelaDate.getText())
                        .font(.footnote)
                        .padding(.leading, 28)
                        .padding(.top,1)
                    Spacer()
                }
                .foregroundColor(xelaDate.getTextColor())
                .frame(width: xelaDate.xelaManager.cellWidth, height: xelaDate.xelaManager.cellWidth)
                .background(xelaDate.isBetweenStartAndEnd && !xelaDate.isSelected ? Color.clear : xelaDate.getBackgroundColor())
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(xelaDate.getTextColor(), lineWidth: borderLineWidth)
                        .opacity(xelaDate.isToday && !xelaDate.isSelected ? 1 : 0)                                     )
                
                Text(DateTime().lettersOfTheDays(date: Int(xelaDate.getText())!, month: (xelaDate.getMonth()), year: (xelaDate.getYear())))
                    .xelaButtonLarge()
                    .foregroundColor(xelaDate.getTextColor())
                    .padding()
            }
        }
    }
}

struct XelaDatePickerCell_Previews: PreviewProvider {
    static var previews: some View {
        XelaDatePickerCell(xelaDate: XelaDate(date: Date(), xelaManager: XelaDateManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60 * 60 * 24 * 365), mode: 0)))
    }
}
