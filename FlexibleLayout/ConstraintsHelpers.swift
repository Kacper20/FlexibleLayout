//
//  NSLayoutConstraint+Helpers.swift
//  FlexibleLayout
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation

struct ConstraintsHelpers {

    private static func activateConstraint(
        fromView: UIView,
        toView: UIView,
        fromAttribute: NSLayoutAttribute,
        toAttribute: NSLayoutAttribute
        ) {
        NSLayoutConstraint(
            item: fromView,
            attribute: fromAttribute,
            relatedBy: .equal,
            toItem: toView,
            attribute: toAttribute,
            multiplier: 1.0,
            constant: 0.0
        ).isActive = true
    }

    static func createHeightEnforcingViewAndSetupConstraints(
        for space: VerticalFlexibleSpace,
        in container: UIView
        ) -> UIView {
        let view = UIView()
        container.addSubview(view)
        view.backgroundColor = .clear
        let from = space.from
        let to = space.to
        activateConstraint(fromView: view, toView: container, fromAttribute: .width, toAttribute: .width)
        activateConstraint(fromView: view, toView: space.from.view, fromAttribute: .centerX, toAttribute: .centerX)
        activateConstraint(fromView: view, toView: from.view, fromAttribute: .top, toAttribute: from.attribute)
        activateConstraint(fromView: view, toView: to.view, fromAttribute: .bottom, toAttribute: to.attribute)

        return view
    }

    static func createWidthEnforcingViewAndSetupConstraints(
        for space: HorizontalFlexibleSpace,
        in container: UIView
        ) -> UIView {
        let view = UIView()
        container.addSubview(view)
        view.backgroundColor = .clear
        let from = space.from
        let to = space.to
        activateConstraint(fromView: view, toView: container, fromAttribute: .height, toAttribute: .height)
        activateConstraint(fromView: view, toView: space.from.view, fromAttribute: .centerY, toAttribute: .centerY)
        activateConstraint(fromView: view, toView: from.view, fromAttribute: .leading, toAttribute: from.attribute)
        activateConstraint(fromView: view, toView: to.view, fromAttribute: .trailing, toAttribute: to.attribute)

        return view
    }
}
