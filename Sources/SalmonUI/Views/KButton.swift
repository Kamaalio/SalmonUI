//
//  KButton.swift
//  KamaalUI
//
//  Created by Kamaal Farah on 06/05/2020.
//

import SwiftUI

public struct KButton<Label>: View where Label: View {
    public var action: () -> Void
    public var label: Label

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
