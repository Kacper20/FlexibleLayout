//
//  FlexibleView+Platforms.swift
//  FlexibleLayout iOS
//
//  Created by Kacper Harasim on 28/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation

#if os(iOS) || os(tvOS)
    import UIKit
    public typealias FlexibleView = UIView
    @available(iOS 9.0, *)
    public typealias FlexibleLayoutGuide = UILayoutGuide
    public typealias FlexibleLayoutAttribute = NSLayoutAttribute
#else
    import AppKit
    public typealias FlexibleView = NSView
    @available(OSX 10.11, *)
    public typealias FlexibleLayoutGuide = NSLayoutGuide
    public typealias FlexibleLayoutAttribute = NSLayoutConstraint.Attribute
#endif

#if os(iOS)
#else
#endif
