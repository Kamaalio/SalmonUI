//
//  KFloatingDatePicker.swift
//  SalmonUI
//
//  Created by Kamaal Farah on 01/07/2021.
//

import SwiftUI

@available(macOS 11.0, iOS 14.0, *)
public struct KFloatingDatePicker: View {
    @Binding public var value: Date

    public let title: String
    public let onChange: (_ newValue: Date) -> Void

    public init(value: Binding<Date>, title: String, onChange: @escaping (_ newValue: Date) -> Void = { _ in }) {
        self._value = value
        self.title = title
        self.onChange = onChange
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.accentColor)
                .offset(y: -25)
                .scaleEffect(0.75, anchor: .leading)
                .padding(.horizontal, 4)
            DatePicker("", selection: $value, displayedComponents: .date)
                .labelsHidden()
        }
        .padding(.top, 12)
        .onChange(of: value, perform: onChange)
    }
}

@available(macOS 11.0, iOS 14.0, *)
struct KFloatingDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        KFloatingDatePicker(value: .constant(Date()), title: "Date", onChange: { _ in })
    }
}
