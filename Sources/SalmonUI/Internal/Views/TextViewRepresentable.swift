//
//  TextViewRepresentable.swift
//  
//
//  Created by Kamaal M Farah on 02/04/2022.
//

import SwiftUI

struct TextViewRepresentable: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UIViewType {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.isScrollEnabled = true
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return textView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        if uiView.text != text {
            uiView.text = text
        }
        if uiView.window != nil, !uiView.isFirstResponder {
            uiView.becomeFirstResponder()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, UITextViewDelegate {
        var parent: TextViewRepresentable

        init(_ parent: TextViewRepresentable) {
            self.parent = parent
        }

        func textViewDidChange(_ textView: UITextView) {
            parent.$text.wrappedValue = textView.text
        }
    }

    typealias UIViewType = UITextView
}
