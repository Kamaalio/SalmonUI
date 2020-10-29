//
//  Previews.swift
//  KamaalUI
//
//  Created by Kamaal Farah on 06/05/2020.
//

#if DEBUG
import SwiftUI

private let lightModeText = "Light mode"
private let darkModeText = "Dark mode"

@available(iOS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, *)
private struct LightPreviewModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .previewLayout(.sizeThatFits)
            .colorScheme(.light)
            .padding()
            .background(Color.white)
    }
}

@available(iOS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, *)
private struct DarkPreviewModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .previewLayout(.sizeThatFits)
            .colorScheme(.dark)
            .padding()
            .background(Color.black)
    }
}

@available(iOS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, *)
private extension View {
    func darkPreviewStyle() -> some View {
        return self.modifier(DarkPreviewModifiers())
    }

    func lightPreviewStyle() -> some View {
        return self.modifier(LightPreviewModifiers())
    }
}

@available(iOS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, *)
struct KButton_Previews: PreviewProvider {
    static var previews: some View {
        let description = "Button"
        let labelText = "Press me!"
        func action() {
            print("press!")
        }
        return Group {
            KButton(action: action) {
                KText(labelText)
            }
            .lightPreviewStyle()
            .previewDisplayName("\(description) \(lightModeText)")
            KButton(action: { action() }, label: {
                KText(labelText)
            })
            .darkPreviewStyle()
            .previewDisplayName("\(description) \(darkModeText)")
        }
    }
}

@available(iOS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, *)
struct KText_Previews: PreviewProvider {
    static var previews: some View {
        let description = "Text"
        let text = "Some Text"
        return Group {
            KText(text)
            .lightPreviewStyle()
            .previewDisplayName("\(description) \(lightModeText)")
            KText(text: text)
            .darkPreviewStyle()
            .previewDisplayName("\(description) \(darkModeText)")
        }
    }
}

#if !os(tvOS) && !os(macOS)
@available(tvOS, unavailable)
@available(macOS, unavailable)
@available(iOS 13.0, watchOS 6.0, *)
struct KTimePicker_Previews: PreviewProvider {
    static var previews: some View {
        let description = "Time picker"
        let selection = Binding.constant(3)
        let steps = 5
        let range = 0..<6
        return Group {
            KTimePicker(selection: selection, steps: steps, range: range)
            .lightPreviewStyle()
            .previewDisplayName("\(description) \(lightModeText)")
            KTimePicker(selection: selection, steps: steps, range: range)
            .darkPreviewStyle()
            .previewDisplayName("\(description) \(darkModeText)")
        }
    }
}
#endif

@available(iOS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, *)
struct KLabeledTextField_Previews: PreviewProvider {
    static var previews: some View {
        let description = "Labeled Text Field"
        let value = Binding.constant("Kama")
        let label = "Name:"
        let placeHolder = "Placeholder"
        return Group {
            KLabeledTextField(
                value: value,
                label: label,
                placeholder: placeHolder)
                .lightPreviewStyle()
                .previewDisplayName("\(description) \(lightModeText)")
            KLabeledTextField(
                value: value,
                label: label,
                placeholder: placeHolder,
                disableTextField: false)
            .darkPreviewStyle()
            .previewDisplayName("\(description) \(darkModeText)")
            KLabeledTextField(
                value: .constant(""),
                label: label,
                placeholder: placeHolder)
                .lightPreviewStyle()
                .previewDisplayName("\(description) \(lightModeText) placeholder")
            KLabeledTextField(
                value: .constant(""),
                label: label,
                placeholder: placeHolder,
                disableTextField: false)
            .darkPreviewStyle()
            .previewDisplayName("\(description) \(darkModeText) placeholder")
            KLabeledTextField(
                value: value,
                label: label,
                placeholder: placeHolder,
                disableTextField: true)
                .lightPreviewStyle()
                .previewDisplayName("\(description) \(lightModeText) disabeled")
            KLabeledTextField(
                value: value,
                label: label,
                placeholder: placeHolder,
                disableTextField: true)
            .darkPreviewStyle()
            .previewDisplayName("\(description) \(darkModeText) disabled")
        }
    }
}

@available(iOS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, *)
struct KRadioCheckBox_Previews: PreviewProvider {
    static var previews: some View {
        let description = "Radio Check Box"
        let color: Color = .accentColor
        let size: CGFloat = 32
        let borderWidth: CGFloat = 4
        let spacing: CGFloat = 4
        return Group {
            KRadioCheckBox(checked: true, color: color, size: size, borderWidth: borderWidth, spacing: spacing)
            .lightPreviewStyle()
            .previewDisplayName("\(description) \(lightModeText)")
            KRadioCheckBox(checked: true, color: color, size: size, borderWidth: borderWidth, spacing: spacing)
            .darkPreviewStyle()
            .previewDisplayName("\(description) \(darkModeText)")
            KRadioCheckBox(checked: false, color: color, size: size, borderWidth: borderWidth, spacing: spacing)
            .lightPreviewStyle()
            .previewDisplayName("\(description) \(lightModeText) unchecked")
            KRadioCheckBox(checked: false, color: color, size: size, borderWidth: borderWidth, spacing: spacing)
            .darkPreviewStyle()
            .previewDisplayName("\(description) \(darkModeText) unchecked")
        }
//        .accentColor(.red)
    }
}
#endif
