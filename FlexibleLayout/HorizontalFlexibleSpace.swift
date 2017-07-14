//
//  HorizontalFlexibleSpace.swift
//  FlexibleLayout
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation

public struct HorizontalFlexibleSpace {
    let from: LayoutXTarget
    let to: LayoutXTarget
    let coefficient: CGFloat
}

public struct HorizontalFlexibleSpaceConstructable {
    let from: LayoutXTarget
    let to: LayoutXTarget

    public func with(_ coefficient: CGFloat) -> HorizontalFlexibleSpace {
        return HorizontalFlexibleSpace(from: from, to: to, coefficient: coefficient)
    }
}
