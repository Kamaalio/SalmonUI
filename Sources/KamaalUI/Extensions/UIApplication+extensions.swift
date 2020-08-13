//
//  UIApplication+extensions.swift
//  KamaalUI
//
//  Created by Kamaal Farah on 07/05/2020.
//

import SwiftUI

#if !os(macOS) && !os(watchOS)
@available(iOS 13.0, tvOS 13.0, *)
@available(watchOS, unavailable)
@available(macOS, unavailable)
public extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

#if os(macOS)
@available(macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(iOS, unavailable)
public extension NSApplication {
    func endEditing() {
        sendAction(#selector(NSResponder.resignFirstResponder), to: nil, from: nil)
    }
}
#endif
