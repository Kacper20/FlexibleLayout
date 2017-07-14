//
//  NSLayoutConstraint+Helpers.swift
//  FlexibleLayout
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation

struct ConstraintsHelpers {
    private static func createHeightEnforcingViewAndSetupConstraints(
        for space: VerticalFlexibleSpace,
        in container: UIView
        ) -> UIView {
        let view = UIView()
        container.addSubview(view)
        view.backgroundColor = .clear

        NSLayoutConstraint(
            item: view,
            attribute: .width,
            relatedBy: .equal,
            toItem: container,
            attribute: .width,
            multiplier: 1.0,
            constant: 0.0
        ).isActive = true

        NSLayoutConstraint(
            item: view,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: space.from.view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0
        ).isActive = true

        NSLayoutConstraint(
            item: view,
            attribute: .top,
            relatedBy: .equal,
            toItem: space.from.view,
            attribute: space.from.attribute,
            multiplier: 1.0,
            constant: 0.0
        ).isActive = true

        NSLayoutConstraint(
            item: view,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: space.to.view,
            attribute: space.to.attribute,
            multiplier: 1.0,
            constant: 0.0
        ).isActive = true

        NSLayoutConstraint(
            item: view,
            attribute: .width,
            relatedBy: .equal,
            toItem: container,
            attribute: .width,
            multiplier: 1.0,
            constant: 0.0
        ).isActive = true
        
        return view
    }
}
