//
//  FlexibleLayout.swift
//  FlexibleLayout
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation

public struct Flexible {

    public static func verticalLayout(
        _ spaces: [VerticalFlexibleSpace],
        in container: UIView
        ) {
        for space in spaces {
            let fromView = space.from.view
            let toView = space.to.view
            if fromView != container && fromView.superview == nil {
                container.addSubview(fromView)
            }
            if toView != container && toView.superview == nil {
                container.addSubview(toView)
            }
        }
    }

    private static func buildVerticalLayout<T>(
        spaces: [VerticalFlexibleSpace],
        in container: UIView,
        generation: (VerticalFlexibleSpace) -> T,
        minimumOffset: CGFloat = 0.0,
        heightSetup: (T, T, CGFloat) -> Void
        ) {
        let sortedSpaces = spaces.sorted(by: { $0.0.coefficient < $0.1.coefficient })
        guard let firstConfiguration = sortedSpaces.first else { return }
        let minimalCoefficient = firstConfiguration.coefficient
        let first = generation(firstConfiguration)
        for space in sortedSpaces.dropFirst() {
            let generated = generation(space)
            heightSetup(first, generated, CGFloat(space.coefficient / minimalCoefficient))
        }
    }
}
