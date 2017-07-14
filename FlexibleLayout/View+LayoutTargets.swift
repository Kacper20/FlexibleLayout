//
//  View+LayoutTargets.swift
//  FlexibleLayout
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation

extension UIView {

    var leftTarget: LayoutXTarget {
        return LayoutXTarget(kind: .left, view: self)
    }

    var rightTarget: LayoutXTarget {
        return LayoutXTarget(kind: .right, view: self)
    }

    var leadingTarget: LayoutXTarget {
        return LayoutXTarget(kind: .leading, view: self)
    }

    var trailingTarget: LayoutXTarget {
        return LayoutXTarget(kind: .trailing, view: self)
    }

    var centerXTarget: LayoutXTarget {
        return LayoutXTarget(kind: .centerX, view: self)
    }

    var leftMarginTarget: LayoutXTarget {
        return LayoutXTarget(kind: .leftMargin, view: self)
    }

    var rightMarginTarget: LayoutXTarget {
        return LayoutXTarget(kind: .rightMargin, view: self)
    }

    var leadingMarginTarget: LayoutXTarget {
        return LayoutXTarget(kind: .leadingMargin, view: self)
    }

    var trailingMarginTarget: LayoutXTarget {
        return LayoutXTarget(kind: .trailingMargin, view: self)
    }

    var centerXWithinMarginsTarget: LayoutXTarget {
        return LayoutXTarget(kind: .centerXWithinMargins, view: self)
    }

    var topTarget: LayoutYTarget {
        return LayoutYTarget(kind: .top, view: self)
    }

    var bottomTarget: LayoutYTarget {
        return LayoutYTarget(kind: .bottom, view: self)
    }

    var centerYTarget: LayoutYTarget {
        return LayoutYTarget(kind: .centerY, view: self)
    }

    var topMarginTarget: LayoutYTarget {
        return LayoutYTarget(kind: .topMargin, view: self)
    }

    var bottomMarginTarget: LayoutYTarget {
        return LayoutYTarget(kind: .bottomMargin, view: self)
    }

    var centerYWithinMarginsTarget: LayoutYTarget {
        return LayoutYTarget(kind: .centerYWithinMargins, view: self)
    }

    var firstBaselineTarget: LayoutYTarget {
        return LayoutYTarget(kind: .firstBaseline, view: self)
    }

    var lastBaselineTarget: LayoutYTarget {
        return LayoutYTarget(kind: .lastBaseline, view: self)
    }
}
