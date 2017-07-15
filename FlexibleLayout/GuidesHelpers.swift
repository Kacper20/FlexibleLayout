//
//  GuidesHelpers.swift
//  FlexibleLayout
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation

@available(iOS 9.0, *)
struct GuidesHelpers {

    static func setupVerticalSpacingLayoutGuide(
        for space: VerticalFlexibleSpace,
        in container: UIView
        ) -> UILayoutGuide {
        let spacingGuide = UILayoutGuide()
        container.addLayoutGuide(spacingGuide)
        spacingGuide.centerXAnchor.constraint(equalTo: space.from.view.centerXAnchor).isActive = true
        spacingGuide.topAnchor.constraint(equalTo: space.from.anchor).isActive = true
        spacingGuide.bottomAnchor.constraint(equalTo: space.to.anchor).isActive = true
        return spacingGuide
    }

    static func setupHorizontalSpacingLayoutGuide(
        for space: HorizontalFlexibleSpace,
        in container: UIView
        ) -> UILayoutGuide {
        let spacingGuide = UILayoutGuide()
        container.addLayoutGuide(spacingGuide)
        spacingGuide.centerYAnchor.constraint(equalTo: space.from.view.centerYAnchor).isActive = true

        let fromTargetAnchor = space.from.isRtlSupportive ? spacingGuide.leadingAnchor : spacingGuide.leftAnchor
        fromTargetAnchor.constraint(equalTo: space.from.anchor).isActive = true
        let toTargetAnchor = space.to.isRtlSupportive ? spacingGuide.trailingAnchor : spacingGuide.rightAnchor
        toTargetAnchor.constraint(equalTo: space.to.anchor).isActive = true
        return spacingGuide
    }
}
