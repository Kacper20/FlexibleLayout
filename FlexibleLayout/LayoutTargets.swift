//
//  LayoutTargetY.swift
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
        }
    }
}

struct LayoutYTarget {

    let view: UIView
    let kind: Kind
    
    enum Kind {
        case top
        case bottom
        case centerY
    }

    init(kind: Kind, view: UIView) {
        self.kind = kind
        self.view = view
    }

    var attribute: NSLayoutAttribute {
        switch self.kind {
        case .top: return .top
        case .bottom: return .bottom
        case .centerY: return .centerY
        }
    }

    @available(iOS 9.0, *)
    var anchor: NSLayoutYAxisAnchor {
        switch self.kind {
        case .top: return view.topAnchor
        case .bottom: return view.bottomAnchor
        case .centerY: return view.centerYAnchor
        }
    }
}
