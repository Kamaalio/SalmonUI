import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct KNamedTextField: View {
    var value: Binding<String>
    var name: String
    var placeholder: String
    var disableTextField: Bool

    public init(value: Binding<String>, name: String, placeholder: String, disableTextField: Bool) {
        self.value = value
        self.name = name
        self.placeholder = placeholder
        self.disableTextField = disableTextField
    }

    public var body: some View {
        HStack {
            Text(name)
                .frame(minWidth: 75 , maxWidth: 75, minHeight: 40, maxHeight: 40)
            TextField(placeholder, text: value)
                .disabled(disableTextField)
        }
    }
}

@available(iOS 13.0, watchOS 6.0, *)
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

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct KText: View {
    var text: String

    public init(_ content: String) {
        self.text = content
    }
    
    public init(text: String) {
        self.text = text
    }

    public var body: some View {
        Text(text)
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct KButton: View {
    var action: () -> Void
    var label: KText

    public init(action: @escaping () -> Void, _ label: KText) {
        self.action = action
        self.label = label
    }
    
    public init(action: @escaping () -> Void, @ViewBuilder label: () -> KText) {
        self.action = action
        self.label = label()
    }

    public var body: some View {
        Button(action: action) { label }
    }
}
