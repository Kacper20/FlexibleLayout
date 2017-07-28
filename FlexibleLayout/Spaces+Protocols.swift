//
//  Spaces+Protocols.swift
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

protocol CoefficientProvidable {
    var coefficient: CGFloat { get }
}

extension VerticalFlexibleSpace: CoefficientProvidable { }

extension HorizontalFlexibleSpace: CoefficientProvidable { }

protocol InvolvedViewsProvidable {
    var views: [FlexibleView] { get }
}

extension VerticalFlexibleSpace: InvolvedViewsProvidable {
    var views: [FlexibleView] {
        return [from.view, to.view]
    }
}

extension HorizontalFlexibleSpace: InvolvedViewsProvidable {
    var views: [FlexibleView] {
        return [from.view, to.view]
    }
}
