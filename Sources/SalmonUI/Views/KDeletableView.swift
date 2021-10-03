//
//  KDeletableView.swift
//  
//
//  Created by Kamaal M Farah on 03/10/2021.
//

import SwiftUI

public struct KDeletableView<Content: View>: View {
    @Binding var isDeleting: Bool

    public let enabled: Bool
    public let deleteText: String
    public let onDelete: () -> Void
    public let content: () -> Content

    private let deleteButtonSize: CGFloat = 68

    public init(isDeleting: Binding<Bool>,
                enabled: Bool,
                deleteText: String = "Delete",
                onDelete: @escaping () -> Void,
                content: @escaping () -> Content) {
        self._isDeleting = isDeleting
        self.enabled = enabled
        self.deleteText = deleteText
        self.onDelete = onDelete
        self.content = content
    }

    public var body: some View {
        HStack {
            if enabled && !isDeleting {
                Button(action: { withAnimation { isDeleting = true } }) {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(.red)
                        .padding(.leading, 20)
                }
                .transition(.move(edge: .leading))
            }
            content()
            if enabled && isDeleting {
                Spacer()
                Button(action: _onDelete) {
                    ZStack {
                        Color.red
                        Text(deleteText)
                            .foregroundColor(Color(.systemBackground))
                    }
                    .frame(minWidth: deleteButtonSize,
                           maxWidth: deleteButtonSize,
                           minHeight: deleteButtonSize,
                           maxHeight: deleteButtonSize)
                }
                .transition(.move(edge: .trailing))
            }
        }
        .ktakeWidthEagerly(alignment: .leading)
    }

    private func _onDelete() {
        onDelete()
        withAnimation { isDeleting = false }
    }
}

public extension View {
    func kDeletableView(isDeleting: Binding<Bool>, enabled: Bool, onDelete: @escaping () -> Void) -> some View {
        KDeletableView(isDeleting: isDeleting, enabled: enabled, onDelete: onDelete, content: { self })
    }
}

struct KDeletableView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Yes delete me")
            .kDeletableView(isDeleting: .constant(true), enabled: true, onDelete: { })
    }
}
