//
//  Color.swift
//  UberSwiftUI
//
//  Created by Sopnil Sohan on 6/7/23.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let backgroundColor = Color("BackgroundColor")
    let secondaryBackgroundColor = Color("SecondaryBackgroundColor")
    let primaryTextColor = Color("PrimaryTextColor")
}
