//
//  HorizontalDistributionView.swift
//  FlexibleLayoutExample
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation
import UIKit
import FlexibleLayout

final class HorizontalDistributionView: UIView {

    let first = UIView()
    let second = UIView()
    let third = UIView()

    init() {
        super.init(frame: .zero)
        setupConstraints()
        backgroundColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        [first, second, third].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = UIColor.black
            $0.widthAnchor.constraint(equalToConstant: 30).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
            $0.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        }
        Flexible.horizontalLayout([
            self.leadingMarginTarget.to(first.leadingTarget).with(1),
            first.trailingTarget.to(second.leadingTarget).with(2),
            second.trailingTarget.to(third.leadingTarget).with(0.5),
            third.trailingTarget.to(self.trailingTarget).with(0.5)
            ], in: self)
    }
}
