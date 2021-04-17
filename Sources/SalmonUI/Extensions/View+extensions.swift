//
//  View+extensions.swift
//  KamaalUI
//
//  Created by Kamaal Farah on 07/05/2020.
//

import SwiftUI

#if !os(macOS) && !os(tvOS)
public extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }

    func ktoast(
        isShowing: Binding<Bool>,
        textLabel: Text,
        toastSize: CGFloat = 20,
        color: Color = .accentColor) -> some View {
        KToast(isShowing: isShowing, toastSize: toastSize, color: color, textLabel: textLabel) { self }
    }
}
#endif

#if !os(macOS)
private struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
#endif
