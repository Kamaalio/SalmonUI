//
//  KButton.swift
//  KamaalUI
//
//  Created by Kamaal Farah on 06/05/2020.
//

import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct KButton<Label>: View where Label: View {
    var action: () -> Void
    var label: Label

    public init(action: @escaping () -> Void, _ label: Label) {
        self.action = action
        self.label = label
    }
    
    public init(action: @escaping () -> Void, @ViewBuilder label: () -> Label) {
        self.action = action
        self.label = label()
    }

    public var body: Button<Label> {
        Button(action: action) {
            label
        }
    }
}
