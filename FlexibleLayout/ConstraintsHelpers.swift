//
//  NSLayoutConstraint+Helpers.swift
//  FlexibleLayout
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation
#if os(iOS) || os(tvOS)
    import UIKit
#else
    import AppKit
#endif

struct ConstraintsHelpers {

    private static func activateConstraint(
        fromView: FlexibleView,
        toView: FlexibleView,
        fromAttribute: FlexibleLayoutAttribute,
        toAttribute: FlexibleLayoutAttribute
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

    static func activateGreaterThanOrEqualConstraint(
        on view: FlexibleView,
        attribute: FlexibleLayoutAttribute,
        constantValue: CGFloat
        ) {
        NSLayoutConstraint(
            item: view,
            attribute: attribute,
            relatedBy: .greaterThanOrEqual,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: 0.0
        ).isActive = true
    }

    static func createHeightEnforcingViewAndSetupConstraints(
        for space: VerticalFlexibleSpace,
        in container: FlexibleView
        ) -> FlexibleView {
        let view = FlexibleView()
        container.addSubview(view)
        #if os(iOS) || os(tvOS)
        view.backgroundColor = .clear
        #else
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.clear.cgColor
        #endif
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
        in container: FlexibleView
        ) -> FlexibleView {
        let view = FlexibleView()
        container.addSubview(view)
        #if os(iOS) || os(tvOS)
        view.backgroundColor = .clear
        #else
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.clear.cgColor
        #endif
        let from = space.from
        let to = space.to
        activateConstraint(fromView: view, toView: container, fromAttribute: .height, toAttribute: .height)
        activateConstraint(fromView: view, toView: space.from.view, fromAttribute: .centerY, toAttribute: .centerY)
        let fromTargetAttribute: FlexibleLayoutAttribute = space.from.isRtlSupportive ? .leading : .left
        activateConstraint(
            fromView: view,
            toView: from.view,
            fromAttribute: fromTargetAttribute,
            toAttribute: from.attribute
        )
        let toTargetAttribute: FlexibleLayoutAttribute = space.to.isRtlSupportive ? .trailing : .right
        activateConstraint(fromView: view, toView: to.view, fromAttribute: toTargetAttribute, toAttribute: to.attribute)

        return view
    }
}
