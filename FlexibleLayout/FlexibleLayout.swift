//
//  FlexibleLayout.swift
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

public struct MinimalCoefficientSize {
    let coefficient: CGFloat
    let value: CGFloat
}

public struct Flexible {

    public static func verticalLayout(
        _ spaces: [VerticalFlexibleSpace],
        in container: FlexibleView,
        coefficientSize: MinimalCoefficientSize? = nil
        ) {
        ensureInViewHierarchy(viewsProvidables: spaces, container: container)
        if #available(iOS 9.0, OSX 10.11, *) {
            let firstItemSetup = firstItemSizeSetupGenerate(
                coefficientSize: coefficientSize,
                itemSetup: { (spacer: FlexibleLayoutGuide, height: CGFloat) in
                    spacer.heightAnchor.constraint(greaterThanOrEqualToConstant: height).isActive = true
                }
            )

            buildLayout(
                spaces: spaces,
                in: container,
                layoutItemGeneration: { space in
                    GuidesHelpers.setupVerticalSpacingLayoutGuide(for: space, in: container)
                },
                dimensionSetup: { (base, other, multiplier) in
                    return setupSizeDependentAnchors(
                        base: base,
                        other: other,
                        dimensionAnchorGenerate: { $0.heightAnchor },
                        multiplier: multiplier)
                },
                firstItemSetup: firstItemSetup
            )
        } else {
            let firstItemSetup = firstItemSizeSetupGenerate(
                coefficientSize: coefficientSize,
                itemSetup: { (spacer: FlexibleView, height: CGFloat) in
                    ConstraintsHelpers.activateGreaterThanOrEqualConstraint(
                        on: spacer,
                        attribute: .height,
                        constantValue: height
                    )
                }
            )
            buildLayout(
                spaces: spaces,
                in: container,
                layoutItemGeneration: { space in
                    return ConstraintsHelpers.createHeightEnforcingViewAndSetupConstraints(for: space, in: container)
                },
                dimensionSetup: { (base, other, multiplier) in
                    return setupSizeDependentViews(
                        base: base,
                        other: other,
                        layoutAttributeGenerate: { _ in .height },
                        multiplier: multiplier)
                },
                firstItemSetup: firstItemSetup
            )
        }
    }

    public static func horizontalLayout(
        _ spaces: [HorizontalFlexibleSpace],
        in container: FlexibleView,
        coefficientSize: MinimalCoefficientSize? = nil
        ) {
        ensureInViewHierarchy(viewsProvidables: spaces, container: container)
        if #available(iOS 9.0, OSX 10.12, *) {
            let firstItemSetup = firstItemSizeSetupGenerate(
                coefficientSize: coefficientSize,
                itemSetup: { (spacer: FlexibleLayoutGuide, width: CGFloat) in
                    spacer.widthAnchor.constraint(greaterThanOrEqualToConstant: width).isActive = true
                }
            )

            buildLayout(
                spaces: spaces,
                in: container,
                layoutItemGeneration: { space in
                    GuidesHelpers.setupHorizontalSpacingLayoutGuide(for: space, in: container)
                },
                dimensionSetup: { (base, other, multiplier) in
                    return setupSizeDependentAnchors(
                        base: base,
                        other: other,
                        dimensionAnchorGenerate: { $0.widthAnchor },
                        multiplier: multiplier)
                },
                firstItemSetup: firstItemSetup
            )
        } else {
            let firstItemSetup = firstItemSizeSetupGenerate(
                coefficientSize: coefficientSize,
                itemSetup: { (spacer: FlexibleView, width: CGFloat) in
                    ConstraintsHelpers.activateGreaterThanOrEqualConstraint(
                        on: spacer,
                        attribute: .width,
                        constantValue: width
                    )
                }
            )

            buildLayout(
                spaces: spaces,
                in: container,
                layoutItemGeneration: { space in
                    return ConstraintsHelpers.createWidthEnforcingViewAndSetupConstraints(for: space, in: container)
            },
                dimensionSetup: { (base, other, multiplier) in
                    return setupSizeDependentViews(
                        base: base,
                        other: other,
                        layoutAttributeGenerate: { _ in .width },
                        multiplier: multiplier)
                },
                firstItemSetup: firstItemSetup
            )
        }
    }

    private static func firstItemSizeSetupGenerate<LayoutSpacer>(
        coefficientSize: MinimalCoefficientSize? = nil,
        itemSetup: @escaping (LayoutSpacer, CGFloat) -> Void
        ) -> ((LayoutSpacer, CGFloat) -> Void)? {
        guard let size = coefficientSize else { return nil }
        return { (spacer, coefficient) in
            itemSetup(spacer, (size.value * coefficient) / size.coefficient)
        }
    }

    private static func ensureInViewHierarchy(viewsProvidables: [InvolvedViewsProvidable], container: FlexibleView) {
        for viewsProvidable in viewsProvidables {
            viewsProvidable.views
                .filter { $0 != container && $0.superview == nil }
                .forEach { container.addSubview($0) }
        }
    }

    @available(iOS 9.0, *)
    @available(OSX 10.11, *)
    private static func setupSizeDependentAnchors(
        base: FlexibleLayoutGuide,
        other: FlexibleLayoutGuide,
        dimensionAnchorGenerate: (FlexibleLayoutGuide) -> NSLayoutDimension,
        multiplier: CGFloat
    ) {
        dimensionAnchorGenerate(other).constraint(
            equalTo: dimensionAnchorGenerate(base),
            multiplier: multiplier,
            constant: 0
        ).isActive = true
    }

    private static func setupSizeDependentViews(
        base: FlexibleView,
        other: FlexibleView,
        layoutAttributeGenerate: (FlexibleView) -> FlexibleLayoutAttribute,
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

    private static func buildLayout<LayoutSpacer, Space: CoefficientProvidable>(
        spaces: [Space],
        in container: FlexibleView,
        layoutItemGeneration: (Space) -> LayoutSpacer,
        dimensionSetup: (LayoutSpacer, LayoutSpacer, CGFloat) -> Void,
        firstItemSetup: ((LayoutSpacer, CGFloat) -> Void)? = nil
        ) {
        let sortedSpaces = spaces.sorted(by: { (first, second) in first.coefficient < second.coefficient })
        guard let firstConfiguration = sortedSpaces.first else { return }
        let minimalCoefficient = firstConfiguration.coefficient
        let first = layoutItemGeneration(firstConfiguration)
        firstItemSetup?(first, minimalCoefficient)
        for space in sortedSpaces.dropFirst() {
            let generated = layoutItemGeneration(space)
            dimensionSetup(first, generated, CGFloat(space.coefficient / minimalCoefficient))
        }
    }
}
