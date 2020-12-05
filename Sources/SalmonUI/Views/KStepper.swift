//
//  KStepper.swift
//  
//
//  Created by Kamaal Farah on 29/10/2020.
//

import SwiftUI

#if !os(macOS) && !os(tvOS)
public struct KStepper: View {
    @State private var incrementOpacity = 1.0
    @State private var decrementOpacity = 1.0

    public let size: CGSize
    public let disableIncrement: Bool
    public let disableDecrement: Bool
    public let onIncrement: () -> Void
    public let onDecrement: () -> Void

    public init(size: CGSize,
                disableIncrement: Bool = false,
                disableDecrement: Bool = false,
                onIncrement: @escaping () -> Void,
                onDecrement: @escaping () -> Void) {
        self.size = size
        self.disableIncrement = disableIncrement
        self.disableDecrement = disableDecrement
        self.onIncrement = onIncrement
        self.onDecrement = onDecrement
    }

    public var body: some View {
        HStack {
            Image(systemName: "minus.rectangle.fill")
                .size(size)
                .opacity(decrementOpacity)
                .disabled(disableDecrement)
                .onTapGesture(perform: {
                    self.decrementOpacity = 0.2
                    self.onDecrement()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation { self.decrementOpacity = 1 }
                    }
                })
            Image(systemName: "plus.rectangle.fill")
                .size(size)
                .opacity(incrementOpacity)
                .disabled(disableIncrement)
                .onTapGesture(perform: {
                    self.incrementOpacity = 0.2
                    self.onIncrement()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation { self.incrementOpacity = 1 }
                    }
                })
        }
        .foregroundColor(.accentColor)
    }
}
#endif
