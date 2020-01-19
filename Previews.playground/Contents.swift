import KamaalUI
import SwiftUI
import PlaygroundSupport
import UIKit

struct FitToPreview: ViewModifier {
    let colorScheme: ColorScheme
    func body(content: Content) -> some View {
        content
            .padding()
            .background(colorScheme == .dark ? Color.black : Color.white)
            .previewLayout(.sizeThatFits)
            .colorScheme(colorScheme)
    }
}

extension View {
    func fitToPreview(colorScheme: ColorScheme) -> some View {
        self.modifier(FitToPreview(colorScheme: colorScheme))
    }
}

func labeledTextFieldView(value: String, label: String, placeholder: String, disableTextField: Bool, colorScheme: ColorScheme) -> some View {
    KLabeledTextField(value: .constant(value), label: label, placeholder: placeholder, disableTextField: disableTextField)
        .fitToPreview(colorScheme: colorScheme)
}

func timePickerView(selection: Int, steps: Int, range: Range<Int>, colorScheme: ColorScheme) -> some View {
    KTimePicker(selection: .constant(selection), steps: steps, range: range)
        .fitToPreview(colorScheme: colorScheme)
}

func textView(text: String, colorScheme: ColorScheme) -> some View {
    KText(text)
        .fitToPreview(colorScheme: colorScheme)
}

func buttonView(action: @escaping () -> Void, text: String, colorScheme: ColorScheme) -> some View {
    KButton(action: {
        action()
    }) {
        KText(text)
    }
        .fitToPreview(colorScheme: colorScheme)
}

var labeledTextFieldViewDark = labeledTextFieldView(value: "hallo", label: "Kamaal:", placeholder: "Field", disableTextField: false, colorScheme: .dark)
var labeledTextFieldViewLight = labeledTextFieldView(value: "hallo", label: "Kamaal:", placeholder: "Field", disableTextField: false, colorScheme: .light)
var timePickerDark = timePickerView(selection: 4, steps: 5, range: 0..<12, colorScheme: .dark)
var timePickerLight = timePickerView(selection: 4, steps: 5, range: 0..<12, colorScheme: .light)
var textDark = textView(text: "Kamaal", colorScheme: .dark)
var textLight = textView(text: "Kamaal", colorScheme: .light)
var buttonviewDark = buttonView(action: { print("yow") }, text: "Yow", colorScheme: .dark)
var buttonviewLight = buttonView(action: { print("yow") }, text: "Yow", colorScheme: .light)

