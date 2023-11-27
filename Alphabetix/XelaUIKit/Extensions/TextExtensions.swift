//
//  TextExtensions.swift
//  TinyCalender
//
//  Created by Zero IT Solutions on 05/01/23.
//  Copyright © 2023 Zero It Solutions. All rights reserved.
//

import SwiftUI

extension Text {
    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 60` and `bold`
     */
    func xelaTitle1() -> Text {
        font(Font.custom("NunitoSans-Bold", size: 60))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 48` and `bold`
     */
    func xelaTitle2() -> Text {
        font(Font.custom("NunitoSans-Bold", size: 48))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 34` and `black`
     */
    func xelaTitle3() -> Text {
        font(Font.custom("NunitoSans-Black", size: 34))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 24` and `bold`
     */
    func xelaHeadline() -> Text {
        font(Font.custom("NunitoSans-Bold", size: 24))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 18` and `bold`
     */
    func xelaSubheadline() -> Text {
        font(Font.custom("NunitoSans-Bold", size: 18))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 16` and `regular`
     */
    func xelaBody() -> Text {
        font(Font.custom("NunitoSans-Regular", size: 16))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 16` and `semibold`
     */
    func xelaBodyBold() -> Text {
        font(Font.custom("NunitoSans-SemiBold", size: 16))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 14` and `regular`
     */
    func xelaSmallBody() -> Text {
        font(Font.custom("NunitoSans-Regular", size: 14))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 14` and `bold`
     */
    func xelaSmallBodyBold() -> Text {
        font(Font.custom("NunitoSans-Bold", size: 14))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 12` and `semibold`
     */
    func xelaCaption() -> Text {
        font(Font.custom("NunitoSans-SemiBold", size: 12))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 16` and `semibold`
     */
    func xelaButtonLarge() -> Text {
        font(Font.custom("NunitoSans-SemiBold", size: 16))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 14` and `bold`
     */
    func xelaButtonMedium() -> Text {
        font(Font.custom("NunitoSans-Bold", size: 14))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 12` and `bold`
     */
    func xelaButtonSmall() -> Text {
        font(Font.custom("NunitoSans-Bold", size: 12))
    }
}
