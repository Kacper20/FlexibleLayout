//
//  FlexibleView+LayoutTargets.swift
//  FlexibleLayout
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation
#if os(iOS)
    import UIKit
#else
    import AppKit
#endif

public extension FlexibleView {
    public var flx: FlexibleLayoutDSL {
        return FlexibleLayoutDSL(view: self)
    }
}
