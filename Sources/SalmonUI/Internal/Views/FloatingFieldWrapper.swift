//
//  FloatingFieldWrapper.swift
//  
//
//  Created by Kamaal M Farah on 31/03/2022.
//

import SwiftUI

struct FloatingFieldWrapper<Field: View>: View {
    let text: String
    let title: String
    let field: () -> Field

    var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .foregroundColor(textColor)
                .offset(y: text.isEmpty ? 0 : -25)
                .scaleEffect(text.isEmpty ? 1 : 0.75, anchor: .leading)
                .padding(.horizontal, titleHorizontalPadding)
            field()
        }
        .padding(.top, 12)
        .animation(.spring(response: 0.5))
    }

    private var textColor: Color {
        if text.isEmpty {
            return .secondary
        }
        return .accentColor
    }

    private var titleHorizontalPadding: CGFloat {
        if text.isEmpty {
            return 4
        }
        return 0
    }
}

struct FloatingFieldWrapper_Previews: PreviewProvider {
    static var previews: some View {
        FloatingFieldWrapper(text: "text", title: "Title", field: {
            TextViewRepresentable(text: .constant("text"))
        })
    }
}
