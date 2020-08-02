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

    func toast(
        isShowing: Binding<Bool>,
        textLabel: Text,
        toastSize: CGFloat = 20,
        color: Color = .accentColor) -> some View {
        Toast(isShowing: isShowing, presenting: { self }, textLabel: textLabel, toastSize: toastSize, color: color)
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

public struct Toast<Presenting>: View where Presenting: View {
    @Binding public var isShowing: Bool

    public let presenting: () -> Presenting
    public let textLabel: Text
    public let toastSize: CGFloat
    public let color: Color

    public init(
        isShowing: Binding<Bool>,
        presenting: @escaping () -> Presenting,
        textLabel: Text,
        toastSize: CGFloat,
        color: Color) {
        self._isShowing = isShowing
        self.presenting = presenting
        self.textLabel = textLabel
        self.toastSize = toastSize
        self.color = color
    }

    public var body: some View {
        ZStack(alignment: .top) {
            VStack {
                self.textLabel
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
            .transition(.opacity)
            .edgesIgnoringSafeArea(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: toastSize, alignment: .top)
            .background(self.color)
            .opacity(self.isShowing ? 1 : 0)
            .zIndex(10)
            self.presenting()
        }
    }
}
