//
//  VerticalFlexibleSpace.swift
//  FlexibleLayout
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation

public struct VerticalFlexibleSpace {
    let from: LayoutYTarget
    let to: LayoutYTarget
    let coefficient: CGFloat
}

public struct VerticalFlexibleSpaceConstructable {
    
    let from: LayoutYTarget
    let to: LayoutYTarget

    public init(from: LayoutYTarget, to: LayoutYTarget) {
        self.from = from
        self.to = to
    }

    public func with(_ coefficient: CGFloat) -> VerticalFlexibleSpace {
        return VerticalFlexibleSpace(from: from, to: to, coefficient: coefficient)
    }
}
