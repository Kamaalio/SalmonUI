//
//  KTimePicker.swift
//  KamaalUI
//
//  Created by Kamaal Farah on 06/05/2020.
//

import SwiftUI

@available(iOS 13.0, watchOS 6.0, tvOS 13.0, OSX 10.15, *)
@available(OSX, unavailable)
@available(tvOS, unavailable)
public struct KTimePicker: View {
    var selection: Binding<Int>
    var steps: Int
    var range: Range<Int>
    
    public init(selection: Binding<Int>, steps: Int, range: Range<Int>) {
        self.selection = selection
        self.steps = steps
        self.range = range
    }

    public var body: some View {
        VStack {
            Picker("", selection: selection) {
                ForEach(range) {
                    Text(String(format: "%02d", $0 * self.steps))
                }
            }
            .labelsHidden()
            .pickerStyle(WheelPickerStyle())
            .frame(minWidth: 75, maxWidth: 75)
            .clipped()
            .padding(.horizontal)
        }
    }
}
