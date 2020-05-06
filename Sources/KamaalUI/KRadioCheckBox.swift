//
//  KRadioCheckBox.swift
//  KamaalUI
//
//  Created by Kamaal Farah on 06/05/2020.
//

import SwiftUI

public struct KRadioCheckBox: View {
    var checked: Bool
    var color: Color
    var size: CGFloat
    var borderWidth: CGFloat
    var spacing: CGFloat

    public var body: some View {
        Circle()
            .foregroundColor(foregroundColor)
            .frame(width: size, height: size)
            .padding(.all, spacing)
            .overlay(
                RoundedRectangle(cornerRadius: size)
                    .stroke(Color.accentColor, lineWidth: borderWidth))
    }

    private var foregroundColor: Color {
        color.opacity(checked ? 1 : 0)
    }
}
