//
//  ScrollableForm.swift
//  
//
//  Created by Kamaal M Farah on 17/08/2022.
//

import SwiftUI

/// Makes sure `Form` is scrollable, especially on macOS
public struct ScrollableForm<Content: View>: View {
    public let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        #if os(macOS)
        ScrollView(.vertical, showsIndicators: true) {
            content
        }
        #else
        Form {
            content
        }
        #endif
    }
}

struct ScrollableForm_Previews: PreviewProvider {
    static var previews: some View {
        ScrollableForm {
            Text("Text")
        }
    }
}
