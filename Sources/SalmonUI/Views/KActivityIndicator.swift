//
//  KActivityIndicator.swift
//  KamaalUI
//
//  Created by Kamaal Farah on 07/05/2020.
//

import SwiftUI

#if !os(macOS)
public struct KActivityIndicator: UIViewRepresentable {
    @Binding public var isAnimating: Bool

    public var style: UIActivityIndicatorView.Style

    public init(isAnimating: Binding<Bool>, style: UIActivityIndicatorView.Style) {
        self._isAnimating = isAnimating
        self.style = style
    }

    public func makeUIView(context: UIViewRepresentableContext<KActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    public func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<KActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
#endif

#if os(macOS)
public struct KActivityIndicator: NSViewRepresentable {
    @Binding public var isAnimating: Bool

    public var style: NSProgressIndicator.Style

    public init(isAnimating: Binding<Bool>, style: NSProgressIndicator.Style) {
        self._isAnimating = isAnimating
        self.style = style
    }

    public func makeNSView(context: Context) -> NSProgressIndicator {
        let progressIndicator = NSProgressIndicator()
        progressIndicator.style = style
        return progressIndicator
    }

    public func updateNSView(_ nsView: NSProgressIndicator, context: Context) {
        isAnimating ? nsView.startAnimation(nil) : nsView.stopAnimation(nil)
    }
}
#endif
