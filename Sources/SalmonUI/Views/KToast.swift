//
//  KToast.swift
//  SalmonUI
//
//  Created by Kamaal Farah on 13/08/2020.
//

import SwiftUI

public struct KToast<Presenting>: View where Presenting: View {
    @Binding public var isShowing: Bool

    public let toastSize: CGFloat
    public let color: Color
    public let textLabel: Text
    public let presenting: () -> Presenting

    public init(
        isShowing: Binding<Bool>,
        toastSize: CGFloat,
        color: Color,
        textLabel: Text,
        presenting: @escaping () -> Presenting) {
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
