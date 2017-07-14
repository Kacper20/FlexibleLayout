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
        ensureInViewHierarchy(viewsProvidables: spaces, container: container)
        if #available(iOS 9.0, *) {
            buildLayout(
                spaces: spaces,
                in: container,
                generation: { space in GuidesHelpers.setupVerticalSpacingLayoutGuide(for: space, in: container) },
                dimensionSetup: { (base, other, multiplier) in
                    return setupSizeDependentAnchors(
                        base: base,
                        other: other,
                        dimensionAnchorGenerate: { $0.heightAnchor },
                        multiplier: multiplier)
                }
            )
        } else {
            buildLayout(
                spaces: spaces,
                in: container,
                generation: { space in
                    return ConstraintsHelpers.createHeightEnforcingViewAndSetupConstraints(for: space, in: container)
                },
                dimensionSetup: { (base, other, multiplier) in
                    return setupSizeDependentViews(
                        base: base,
                        other: other,
                        layoutAttributeGenerate: { _ in .height },
                        multiplier: multiplier)
                }
            )
        }
    }

    public static func horizontalLayout(
        _ spaces: [HorizontalFlexibleSpace],
        in container: UIView
        ) {
        ensureInViewHierarchy(viewsProvidables: spaces, container: container)
        if #available(iOS 9.0, *) {
            buildLayout(
                spaces: spaces,
                in: container,
                generation: { space in GuidesHelpers.setupHorizontalSpacingLayoutGuide(for: space, in: container) },
                dimensionSetup: { (base, other, multiplier) in
                    return setupSizeDependentAnchors(
                        base: base,
                        other: other,
                        dimensionAnchorGenerate: { $0.widthAnchor },
                        multiplier: multiplier)
            }
            )
        } else {
            buildLayout(
                spaces: spaces,
                in: container,
                generation: { space in
                    return ConstraintsHelpers.createWidthEnforcingViewAndSetupConstraints(for: space, in: container)
            },
                dimensionSetup: { (base, other, multiplier) in
                    return setupSizeDependentViews(
                        base: base,
                        other: other,
                        layoutAttributeGenerate: { _ in .width },
                        multiplier: multiplier)
                }
            )
        }
    }

    private static func ensureInViewHierarchy(viewsProvidables: [InvolvedViewsProvidable], container: UIView) {
        for viewsProvidable in viewsProvidables {
            viewsProvidable.views
                .filter { $0 != container && $0.superview == nil }
                .forEach { container.addSubview($0) }
        }
    }

    @available(iOS 9.0, *)
    private static func setupSizeDependentAnchors(
        base: UILayoutGuide,
        other: UILayoutGuide,
        dimensionAnchorGenerate: (UILayoutGuide) -> NSLayoutDimension,
        multiplier: CGFloat
    ) {
        dimensionAnchorGenerate(other).constraint(
            equalTo: dimensionAnchorGenerate(base),
            multiplier: multiplier,
            constant: 0
        ).isActive = true
    }

    private static func setupSizeDependentViews(
        base: UIView,
        other: UIView,
        layoutAttributeGenerate: (UIView) -> NSLayoutAttribute,
        multiplier: CGFloat
        ) {
        NSLayoutConstraint(
            item: other,
            attribute: layoutAttributeGenerate(other),
            relatedBy: .equal,
            toItem: base,
            attribute: layoutAttributeGenerate(base),
            multiplier: multiplier,
            constant: 0
        ).isActive = true
    }

    private static func buildLayout<T, C: CoefficientProvidable>(
        spaces: [C],
        in container: UIView,
        generation: (C) -> T,
        minimumOffset: CGFloat = 0.0,
        dimensionSetup: (T, T, CGFloat) -> Void
        ) {
        let sortedSpaces = spaces.sorted(by: { $0.0.coefficient < $0.1.coefficient })
        guard let firstConfiguration = sortedSpaces.first else { return }
        let minimalCoefficient = firstConfiguration.coefficient
        let first = generation(firstConfiguration)
        for space in sortedSpaces.dropFirst() {
            let generated = generation(space)
            dimensionSetup(first, generated, CGFloat(space.coefficient / minimalCoefficient))
        }
    }
}
