//
//  KSheetStack.swift
//  SalmonUI
//
//  Created by Kamaal Farah on 01/07/2021.
//

import SwiftUI

public struct KSheetStack<LeadingNavButton: View, TrailingNavButton: View, Content: View>: View {
    public let title: String
    public let leadingNavigationButton: () -> LeadingNavButton
    public let trailingNavigationButton: () -> TrailingNavButton
    public let horizontalPadding: CGFloat
    public let content: () -> Content

    private let navigationButtonWidth: CGFloat = 60

    public init(title: String = "",
                horizontalPadding: CGFloat = 32,
                leadingNavigationButton:  @escaping () -> LeadingNavButton,
                trailingNavigationButton:  @escaping () -> TrailingNavButton,
                content: @escaping () -> Content) {
        self.title = title
        self.leadingNavigationButton = leadingNavigationButton
        self.trailingNavigationButton = trailingNavigationButton
        self.horizontalPadding = horizontalPadding
        self.content = content
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                leadingNavigationButton()
                    .frame(minWidth: navigationButtonWidth, maxWidth: navigationButtonWidth, alignment: .leading)
                Spacer()
                if !title.isEmpty {
                    Text(title)
                        .font(.headline)
                        .bold()
                }
                Spacer()
                trailingNavigationButton()
                    .frame(minWidth: navigationButtonWidth, maxWidth: navigationButtonWidth, alignment: .trailing)
            }
            .padding(.horizontal, horizontalPadding)
            .padding(.top, 32)
            ScrollView(.vertical, showsIndicators: true) {
                content()
                    .padding(.horizontal, horizontalPadding)
            }
        }
    }
}

struct KSheetStack_Previews: PreviewProvider {
    static var previews: some View {
        KSheetStack(title: "Premium Features", leadingNavigationButton: {
            Button(action: { }) {
                Text("Edit")
                    .font(.headline)
            }
        }, trailingNavigationButton: {
            Button(action: { }) {
                Text("Close")
                    .font(.headline)
            }
        }) {
            VStack(alignment: .leading) {
                Text("Unlock all premium features")
                    .font(.body)
                    .padding(.vertical, 16)
                Text("􀀁 Sync between all your devices with iCloud, or simply use it as a backup.")
                    .font(.body)
                Text("􀀁 Group all your colors in to categories.")
                    .font(.body)
                Spacer()
            }
        }
        .previewLayout(.sizeThatFits)
    }
}
