//
//  Image+extensions.swift
//  
//
//  Created by Kamaal Farah on 29/10/2020.
//

import SwiftUI

public extension Image {
    func size(_ imageSize: CGSize) -> some View {
        self
            .resizable()
            .frame(width: imageSize.width, height: imageSize.height)
    }

    func bold() -> some View {
        self.modifier(ImageBoldViewModifier(font: .body))
    }

    func bold(_ font: Font) -> some View {
        self.modifier(ImageBoldViewModifier(font: font))
    }
}

private struct ImageBoldViewModifier: ViewModifier {
    let font: Font

    func body(content: Content) -> some View {
        content.font(font.bold())
    }
}
