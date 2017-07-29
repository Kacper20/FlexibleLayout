//
//  LayoutYTarget.swift
//  FlexibleLayout
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation
#if os(iOS)
    import UIKit
#else
    import AppKit
#endif

public struct LayoutYTarget {

    let view: FlexibleView
    let kind: Kind

    enum Kind {
        case top
        case bottom
        case centerY
        case topMargin
        case bottomMargin
        case centerYWithinMargins
        case firstBaseline
        case lastBaseline
    }

    init(kind: Kind, view: FlexibleView) {
        self.kind = kind
        self.view = view
    }

    var attribute: FlexibleLayoutAttribute {
        switch kind {
        case .top: return .top
        case .bottom: return .bottom
        case .centerY: return .centerY
        case .firstBaseline: return .firstBaseline
        case .lastBaseline: return .lastBaseline
        default: break
        }
        #if os(iOS)
        switch kind {
        case .topMargin: return .topMargin
        case .bottomMargin: return .bottomMargin
        case .centerYWithinMargins: return .centerYWithinMargins
        default: break
        }
        #endif
        fatalError("Should never happen")
    }

    @available(iOS 9.0, *)
    var anchor: NSLayoutYAxisAnchor {
        switch kind {
        case .top: return view.topAnchor
        case .bottom: return view.bottomAnchor
        case .centerY: return view.centerYAnchor
        case .firstBaseline: return view.firstBaselineAnchor
        case .lastBaseline: return view.lastBaselineAnchor
        default: break
        }
        #if os (iOS)
        switch kind {
        case .topMargin: return view.layoutMarginsGuide.topAnchor
        case .bottomMargin: return view.layoutMarginsGuide.bottomAnchor
        case .centerYWithinMargins: return view.layoutMarginsGuide.centerYAnchor
        default: break
        }
        #endif
        fatalError("Should never happen")
    }

    public func to(_ other: LayoutYTarget) -> VerticalFlexibleSpaceConstructable {
        return VerticalFlexibleSpaceConstructable(from: self, to: other)
    }
}
