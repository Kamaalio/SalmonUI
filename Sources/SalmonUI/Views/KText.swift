//
//  KText.swift
//  KamaalUI
//
//  Created by Kamaal Farah on 06/05/2020.
//

import SwiftUI

public struct KText: View {
    public var text: String

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
