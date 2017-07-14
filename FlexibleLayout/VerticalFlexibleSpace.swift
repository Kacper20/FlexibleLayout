//
//  VerticalFlexibleSpace.swift
//  FlexibleLayout
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation

public struct VerticalFlexibleSpace {
    let constructable: VerticalFlexibleSpaceConstructable
    let coefficient: CGFloat
}

public struct VerticalFlexibleSpaceConstructable {
    let from: LayoutYTarget
    let to: LayoutYTarget

    public func with(_ coefficient: CGFloat) -> VerticalFlexibleSpace {
        return VerticalFlexibleSpace(constructable: self, coefficient: coefficient)
    }
}
