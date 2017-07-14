//
//  LayoutXTarget.swift
//  FlexibleLayout
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation

public struct LayoutXTarget {

    let view: UIView
    let kind: Kind

    public enum Kind {
        case left
        case right
        case leading
        case trailing
        case centerX
        case leftMargin
        case rightMargin
        case leadingMargin
        case trailingMargin
        case centerXWithinMargins
    }

    init(kind: Kind, view: UIView) {
        self.kind = kind
        self.view = view
    }

    var attribute: NSLayoutAttribute {
        switch self.kind {
        case .left: return .left
        case .right: return .right
        case .leading: return .leading
        case .trailing: return .trailing
        case .centerX: return .centerX
        case .leftMargin: return .leftMargin
        case .rightMargin: return .rightMargin
        case .leadingMargin: return .leadingMargin
        case .trailingMargin: return .trailingMargin
        case .centerXWithinMargins: return .centerXWithinMargins
        }
    }

    @available(iOS 9.0, *)
    var anchor: NSLayoutXAxisAnchor {
        switch self.kind {
        case .left: return view.leftAnchor
        case .right: return view.rightAnchor
        case .leading: return view.leadingAnchor
        case .trailing: return view.trailingAnchor
        case .centerX: return view.centerXAnchor
        case .leftMargin: return view.layoutMarginsGuide.leftAnchor
        case .rightMargin: return view.layoutMarginsGuide.rightAnchor
        case .leadingMargin: return view.layoutMarginsGuide.leadingAnchor
        case .trailingMargin: return view.layoutMarginsGuide.trailingAnchor
        case .centerXWithinMargins: return view.layoutMarginsGuide.centerXAnchor
        }
    }
}
