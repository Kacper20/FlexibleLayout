//
//  View+LayoutTargets.swift
//  FlexibleLayout
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation

extension UIView {

    public var leftTarget: LayoutXTarget {
        return LayoutXTarget(kind: .left, view: self)
    }

    public var rightTarget: LayoutXTarget {
        return LayoutXTarget(kind: .right, view: self)
    }

    public var leadingTarget: LayoutXTarget {
        return LayoutXTarget(kind: .leading, view: self)
    }

    public var trailingTarget: LayoutXTarget {
        return LayoutXTarget(kind: .trailing, view: self)
    }

    public var centerXTarget: LayoutXTarget {
        return LayoutXTarget(kind: .centerX, view: self)
    }

    public var leftMarginTarget: LayoutXTarget {
        return LayoutXTarget(kind: .leftMargin, view: self)
    }

    public var rightMarginTarget: LayoutXTarget {
        return LayoutXTarget(kind: .rightMargin, view: self)
    }

    public var leadingMarginTarget: LayoutXTarget {
        return LayoutXTarget(kind: .leadingMargin, view: self)
    }

    public var trailingMarginTarget: LayoutXTarget {
        return LayoutXTarget(kind: .trailingMargin, view: self)
    }

    public var centerXWithinMarginsTarget: LayoutXTarget {
        return LayoutXTarget(kind: .centerXWithinMargins, view: self)
    }

    public var topTarget: LayoutYTarget {
        return LayoutYTarget(kind: .top, view: self)
    }

    public var bottomTarget: LayoutYTarget {
        return LayoutYTarget(kind: .bottom, view: self)
    }

    public var centerYTarget: LayoutYTarget {
        return LayoutYTarget(kind: .centerY, view: self)
    }

    public var topMarginTarget: LayoutYTarget {
        return LayoutYTarget(kind: .topMargin, view: self)
    }

    public var bottomMarginTarget: LayoutYTarget {
        return LayoutYTarget(kind: .bottomMargin, view: self)
    }

    public var centerYWithinMarginsTarget: LayoutYTarget {
        return LayoutYTarget(kind: .centerYWithinMargins, view: self)
    }

    public var firstBaselineTarget: LayoutYTarget {
        return LayoutYTarget(kind: .firstBaseline, view: self)
    }

    public var lastBaselineTarget: LayoutYTarget {
        return LayoutYTarget(kind: .lastBaseline, view: self)
    }
}
