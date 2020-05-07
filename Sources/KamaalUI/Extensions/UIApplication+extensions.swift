//
//  UIApplication+extensions.swift
//  KamaalUI
//
//  Created by Kamaal Farah on 07/05/2020.
//

#if !os(OSX)
import UIKit
#endif

#if !os(OSX) && !os(watchOS)
@available(watchOS, unavailable)
@available(OSX, unavailable)
@available(iOS 13.0, tvOS 13.0, *)
public extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
