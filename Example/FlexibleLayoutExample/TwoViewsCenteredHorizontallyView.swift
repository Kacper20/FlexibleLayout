//
//  TwoViewsCenteredHorizontallyView.swift
//  FlexibleLayoutExample
//
//  Created by Kacper Harasim on 15/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation
import UIKit
import FlexibleLayout

final class TwoViewsCenteredHorizontallyView: UIView {

    let first = UIView()
    let second = UIView()

    init() {
        super.init(frame: .zero)
        setupConstraints()
        backgroundColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        [first, second].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = UIColor.black
            $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
            $0.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        }
        second.leadingAnchor.constraint(equalTo: first.trailingAnchor, constant: 10).isActive = true
        Flexible.horizontalLayout([
            self.leftTarget.to(first.leftTarget).with(1),
            second.trailingTarget.to(self.trailingTarget).with(1)
            ], in: self)
    }
}
