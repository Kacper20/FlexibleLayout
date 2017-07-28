//
//  FlexibleView+Platforms.swift
//  FlexibleLayout iOS
//
//  Created by Kacper Harasim on 28/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation

#if os(iOS)
    import UIKit
    public typealias FlexibleView = UIView
#else
    import AppKit
    public typealias FlexibleView = NSView
#endif
