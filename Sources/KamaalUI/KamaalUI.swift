import SwiftUI

#if canImport(SwiftUI)
public struct Hello {
    public var text = "Hello, World!"
    public init() { }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct KTextField: View {
    var value: Binding<String>
    let name: String
    let placeholder: String
    let disableTextField: Bool

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
#endif
