//
//  TextFieldModifire.swift
//  UberSwiftUI
//
//  Created by Sopnil Sohan on 6/7/23.
//

import Foundation
import SwiftUI

struct customViewModifier: ViewModifier {
    var roundedCornes: CGFloat
//    var startColor: Color
//    var endColor: Color
    var textColor: Color

    func body(content: Content) -> some View {
        content
            .padding(2)
//            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .background(Color(.systemGray4).opacity(0.5))
            .cornerRadius(roundedCornes)
            .foregroundColor(textColor)
            .overlay(RoundedRectangle(cornerRadius: roundedCornes)
                .stroke(Color.gray, lineWidth: 1))
//            .shadow(radius: 2)
    }
}
