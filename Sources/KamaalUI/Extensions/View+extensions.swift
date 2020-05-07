//
//  View+extensions.swift
//  KamaalUI
//
//  Created by Kamaal Farah on 07/05/2020.
//

import SwiftUI

#if !os(OSX)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(OSX, unavailable)
public extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}
#endif

#if !os(OSX)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(OSX, unavailable)
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
