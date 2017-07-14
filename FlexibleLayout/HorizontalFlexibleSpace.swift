//
//  HorizontalFlexibleSpace.swift
//  FlexibleLayout
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation

public struct HorizontalFlexibleSpace {
    let constructable: HorizontalFlexibleSpaceConstructable
    let coefficient: CGFloat
}

public struct HorizontalFlexibleSpaceConstructable {
    let from: LayoutXTarget
    let to: LayoutXTarget

    public func with(_ coefficient: CGFloat) -> HorizontalFlexibleSpace {
        return HorizontalFlexibleSpace(constructable: self, coefficient: coefficient)
    }
}
