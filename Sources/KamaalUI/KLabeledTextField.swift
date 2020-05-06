//
//  KLabeledTextField.swift
//  KamaalUI
//
//  Created by Kamaal Farah on 06/05/2020.
//

import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct KLabeledTextField: View {
    var value: Binding<String>
    var label: String
    var placeholder: String
    var disableTextField: Bool

    public init(value: Binding<String>, label: String, placeholder: String) {
        self.value = value
        self.label = label
        self.placeholder = placeholder
        self.disableTextField = false
    }

    public init(value: Binding<String>, label: String, placeholder: String, disableTextField: Bool) {
        self.value = value
        self.label = label
        self.placeholder = placeholder
        self.disableTextField = disableTextField
    }

    public var body: some View {
        HStack {
            Text(label)
                .frame(minWidth: 75 , maxWidth: 75, minHeight: 40, maxHeight: 40)
                .foregroundColor(disableTextField ? .secondary : .primary)
            TextField(placeholder, text: value)
                .disabled(disableTextField)
                .foregroundColor(disableTextField ? .secondary : .primary)
        }
    }
}
