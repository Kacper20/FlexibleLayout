//
//  Spaces+Protocols.swift
//  FlexibleLayout
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation

protocol CoefficientProvidable {
    var coefficient: CGFloat { get }
}

extension VerticalFlexibleSpace: CoefficientProvidable { }

extension HorizontalFlexibleSpace: CoefficientProvidable { }

protocol InvolvedViewsProvidable {
    var views: [UIView] { get }
}

extension VerticalFlexibleSpace: InvolvedViewsProvidable {
    var views: [UIView] {
        return [from.view, to.view]
    }
}

extension HorizontalFlexibleSpace: InvolvedViewsProvidable {
    var views: [UIView] {
        return [from.view, to.view]
    }
}
