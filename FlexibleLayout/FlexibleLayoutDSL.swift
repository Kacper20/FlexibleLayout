//
//  FlexibleLayoutDSL.swift
//  FlexibleLayout
//
//  Created by Kacper Harasim on 15/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation

public struct FlexibleLayoutDSL {

    let view: UIView

    public var left: LayoutXTarget {
        return LayoutXTarget(kind: .left, view: view)
    }

    public var right: LayoutXTarget {
        return LayoutXTarget(kind: .right, view: view)
    }

    public var leading: LayoutXTarget {
        return LayoutXTarget(kind: .leading, view: view)
    }

    public var trailing: LayoutXTarget {
        return LayoutXTarget(kind: .trailing, view: view)
    }

    public var centerX: LayoutXTarget {
        return LayoutXTarget(kind: .centerX, view: view)
    }

    public var leftMargin: LayoutXTarget {
        return LayoutXTarget(kind: .leftMargin, view: view)
    }

    public var rightMargin: LayoutXTarget {
        return LayoutXTarget(kind: .rightMargin, view: view)
    }

    public var leadingMargin: LayoutXTarget {
        return LayoutXTarget(kind: .leadingMargin, view: view)
    }

    public var trailingMargin: LayoutXTarget {
        return LayoutXTarget(kind: .trailingMargin, view: view)
    }

    public var centerXWithinMargins: LayoutXTarget {
        return LayoutXTarget(kind: .centerXWithinMargins, view: view)
    }

    public var top: LayoutYTarget {
        return LayoutYTarget(kind: .top, view: view)
    }

    public var bottom: LayoutYTarget {
        return LayoutYTarget(kind: .bottom, view: view)
    }

    public var centerY: LayoutYTarget {
        return LayoutYTarget(kind: .centerY, view: view)
    }

    public var topMargin: LayoutYTarget {
        return LayoutYTarget(kind: .topMargin, view: view)
    }

    public var bottomMargin: LayoutYTarget {
        return LayoutYTarget(kind: .bottomMargin, view: view)
    }

    public var centerYWithinMargins: LayoutYTarget {
        return LayoutYTarget(kind: .centerYWithinMargins, view: view)
    }

    public var firstBaseline: LayoutYTarget {
        return LayoutYTarget(kind: .firstBaseline, view: view)
    }

    public var lastBaseline: LayoutYTarget {
        return LayoutYTarget(kind: .lastBaseline, view: view)
    }
}
