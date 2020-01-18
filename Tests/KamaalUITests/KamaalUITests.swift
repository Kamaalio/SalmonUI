import XCTest
@testable import KamaalUI

final class KamaalUITests: XCTestCase {
    func testkNamedTextField() {
        let value = "", name = "Kamaal:", placeholder = "Field", disableTextField = false
        var component = KNamedTextField(value: .constant(value), name: name, placeholder: placeholder, disableTextField: disableTextField)
        XCTAssertTrue(component.value.wrappedValue == value)
        XCTAssertTrue(component.name == name)
        XCTAssertTrue(component.placeholder == placeholder)
        XCTAssertTrue(component.disableTextField == disableTextField)
        component.disableTextField.toggle()
        XCTAssertFalse(component.disableTextField == disableTextField)
    }
        
    func testkTimePicker() {
        let selection = 2, steps = 5, range = 0..<12
        let component = KTimePicker(selection: .constant(selection), steps: steps, range: range)
        XCTAssertTrue(component.selection.wrappedValue * steps == 10)
        XCTAssertTrue(component.steps == steps)
        XCTAssertTrue(component.range == range)
    }
        
    func testkText() {
        let text = "Hallo"
        let component = KText(text)
        XCTAssertTrue(component.text == text)
    }

    static var allTests = [
        ("testkNamedTextField", testkNamedTextField),
        ("testkTimePicker", testkTimePicker),
        ("testkText", testkText),
    ]
}
