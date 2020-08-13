//
//  KPullToRefreshStack.swift
//  
//
//  Created by Kamaal Farah on 13/08/2020.
//

import SwiftUI

#if !os(watchOS) && !os(tvOS) && !os(macOS)
@available(iOS 13.0, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@available(macOS, unavailable)
public struct KPullToRefreshStack<Presenting>: UIViewRepresentable where Presenting: View {
    @Binding public var isShowing: Bool

    public var size: CGSize
    public var action: () -> Void
    public var presenting: () -> Presenting

    public init(isShowing: Binding<Bool>,
         size: CGSize,
         action: @escaping () -> Void,
         presenting: @escaping () -> Presenting) {
        self._isShowing = isShowing
        self.size = size
        self.action = action
        self.presenting = presenting
    }

    public func makeCoordinator() -> Coordinator {
        return Coordinator(self, action: self.action)
    }

    public func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        let refreshControl = UIRefreshControl()
        scrollView.refreshControl = refreshControl
        context.coordinator.refreshControl = refreshControl
        scrollView.refreshControl?.addTarget(context.coordinator,
                                          action: #selector(Coordinator.handleRefreshControl),
                                          for: .valueChanged)
        let presentingView = UIHostingController(rootView: self.presenting())
        let width = self.size.width, height = self.size.height
        presentingView.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        scrollView.addSubview(presentingView.view)
        return scrollView
    }

    public func updateUIView(_ uiView: UIScrollView, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            if self.isShowing {
                context.coordinator.refreshControl?.beginRefreshing()
            } else {
                context.coordinator.refreshControl?.endRefreshing()
            }
        }
    }

    public class Coordinator {
        public var control: KPullToRefreshStack
        public var action: () -> Void

        public var refreshControl: UIRefreshControl?

        public init(_ control: KPullToRefreshStack, action: @escaping  () -> Void) {
            self.control = control
            self.action = action
        }

        @objc
        public func handleRefreshControl(sender: UIRefreshControl) {
            self.control.isShowing = true
            self.action()
        }
    }
}
#endif
