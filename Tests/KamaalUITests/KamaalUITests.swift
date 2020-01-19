import XCTest
@testable import KamaalUI

final class KamaalUITests: XCTestCase {
    @available(tvOS 13.0, *)
    func testkLabeledTextField() {
        let value = "", label = "Kamaal:", placeholder = "Field", disableTextField = false
        var component = KLabeledTextField(value: .constant(value), label: label, placeholder: placeholder, disableTextField: disableTextField)
        XCTAssertTrue(component.value.wrappedValue == value)
        XCTAssertTrue(component.label == label)
        XCTAssertTrue(component.placeholder == placeholder)
        XCTAssertTrue(component.disableTextField == disableTextField)
        component.disableTextField.toggle()
        XCTAssertFalse(component.disableTextField == disableTextField)
    }
       
    @available(tvOS 13.0, *)
    @available(OSX, unavailable)
    @available(tvOS, unavailable)
    func testkTimePicker() {
        let selection = 2, steps = 5, range = 0..<12
        let component = KTimePicker(selection: .constant(selection), steps: steps, range: range)
        XCTAssertTrue(component.selection.wrappedValue * steps == 10)
        XCTAssertTrue(component.steps == steps)
        XCTAssertTrue(component.range == range)
    }
        
    @available(tvOS 13.0, *)
    func testkText() {
        let text = "Hallo"
        let component = KText(text)
        XCTAssertTrue(component.text == text)
    }
    
    @available(tvOS 13.0, *)
    func testKButton() {
        var i = 1
        let component = KButton(action: { i += 1 }) {
            KText("hallo")
        }
        component.action()
        XCTAssertTrue(i == 2)
    }

    static var allTests = [
        ("testkLabeledTextField", testkLabeledTextField),
        ("testkTimePicker", testkTimePicker),
        ("testkText", testkText),
        ("testKButton", testKButton),
    ]
}
