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

    var topTarget: LayoutYTarget {
        return LayoutYTarget(kind: .top, view: self)
    }

    var bottomTarget: LayoutYTarget {
        return LayoutYTarget(kind: .bottom, view: self)
    }

    var centerYTarget: LayoutYTarget {
        return LayoutYTarget(kind: .centerY, view: self)
    }
}
