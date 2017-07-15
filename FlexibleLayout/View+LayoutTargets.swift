//
//  View+LayoutTargets.swift
//  FlexibleLayout
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation

public extension UIView {
    public var flx: FlexibleLayoutDSL {
        return FlexibleLayoutDSL(view: self)
    }
}
