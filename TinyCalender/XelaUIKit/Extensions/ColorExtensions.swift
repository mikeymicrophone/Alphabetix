//
//  ColorExtensions.swift
//  XelaExampleApp
//
//  Created by Zero IT Solutions on 02/01/23.
//  Copyright © 2023 Zero It Solutions. All rights reserved.
//

import SwiftUI

extension Color {
    
    
    public static var app_pink_color: Color {
        return  Color(UIColor(red: 1.0, green: 0.57, blue:0.69, alpha: 1.0))
    }
    
    public static var app_white: Color {
        return  Color(UIColor(red: 1.0, green: 1.0, blue:1.0, alpha: 1.0))
    }
    public static var app_Black: Color {
        return  Color(UIColor(red: 0.0, green: 0.0, blue:0.0, alpha: 1.0))
    }
    public static var app_blue: Color {
        return  Color.blue
    }



    
    
    /**
     Modify the Color.

     - Returns: `Color` with `color from XelaColorModel`
     */
    init(xelaColor string: XelaColor) {
        var string: String = string.rawValue.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }

        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }

        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }

        // Scanner creation
        let scanner = Scanner(string: string)

        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        if string.count == 2 {
            let mask = 0xFF

            let g = Int(color) & mask

            let gray = Double(g) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)

        } else if string.count == 4 {
            let mask = 0x00FF

            let g = Int(color >> 8) & mask
            let a = Int(color) & mask

            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)

        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)

        } else if string.count == 8 {
            let mask = 0x0000_00FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)

        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}
