//
//  KText.swift
//  KamaalUI
//
//  Created by Kamaal Farah on 06/05/2020.
//

import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct KText: View {
    var text: String

    public init(_ content: String) {
        self.text = content
    }
    
    public init(text: String) {
        self.text = text
    }

    public var body: Text {
        Text(text)
    }
}
