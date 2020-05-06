[**back**](../README.md)

## Cheat Sheet

### Text

```Swift
import KamaalUI

struct ContentView: View {
    var body: some View {
        KText("HI 🙋‍♂️")
    }
}
```

### Button

```Swift
import KamaalUI

struct ContentView: View {
    @State private var count = 1
    var body: some View {
        KButton(action: {
            count += 1
        }) {
            KText("HI agent \(count) 🙋‍♂️")
        }
    }
}
```

### Time Picker

```Swift
import KamaalUI

struct ContentView: View {
    @State private var selection = 1
    var body: some View {
        KTimePicker(selection: $selection, steps: 5, range: 0..<13)
    }
}
```

### Labeled Text Field

```Swift
import KamaalUI

struct ContentView: View {
    @State private var value = ""
    var body: some View {
        KLabeledTextField(value: value, label: "Name:", placeholder: "", disableTextField: false)
    }
}
```
