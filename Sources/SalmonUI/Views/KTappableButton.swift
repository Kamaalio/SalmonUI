//
//  KTappableButton.swift
//  
//
//  Created by Kamaal Farah on 29/10/2020.
//

import SwiftUI

#if !os(tvOS)
public struct KTappableButton<Label>: View where Label: View {
    public let action: () -> Void
    public let label: Label

    public init(action: @escaping () -> Void, @ViewBuilder label: () -> Label) {
        self.action = action
        self.label = label()
    }

    public var body: some View {
        label
            .onTapGesture(perform: action)
    }
}
#endif
