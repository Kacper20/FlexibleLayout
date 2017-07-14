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
        in container: UIView,
        defaultMinimumOffset: CGFloat = 0.0
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
}
