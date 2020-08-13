//
//  View+extensions.swift
//  KamaalUI
//
//  Created by Kamaal Farah on 07/05/2020.
//

import SwiftUI

#if !os(macOS)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
public extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        return clipShape(RoundedCorner(radius: radius, corners: corners) )
    }

    func ktoast(
        isShowing: Binding<Bool>,
        textLabel: Text,
        toastSize: CGFloat = 20,
        color: Color = .accentColor) -> some View {
        return KToast(isShowing: isShowing, toastSize: toastSize, color: color, textLabel: textLabel) { self }
    }

    /// To be deprecated in v3
    /// Use ktoast instead
    func toast(
        isShowing: Binding<Bool>,
        textLabel: Text,
        toastSize: CGFloat = 20,
        color: Color = .accentColor) -> some View {
        return Toast(isShowing: isShowing, presenting: { self }, textLabel: textLabel, toastSize: toastSize, color: color)
    }

    func kpullToRefresh(isShowing: Binding<Bool>, action: @escaping () -> Void) -> some View {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width, screenHeight = screenSize.height
        let size = CGSize(width: screenWidth, height: screenHeight)
        return KPullToRefreshStack(isShowing: isShowing, size: size, action: action) { self }
        .edgesIgnoringSafeArea(.all)
    }
}
#endif

#if !os(macOS)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
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
