//
//  VerticalDistributionView.swift
//  FlexibleLayoutExample
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation
import UIKit
import FlexibleLayout


final class VerticalDistributionView: UIView {

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
            $0.backgroundColor = UIColor.blue
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
            $0.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        }

        Flexible.verticalLayout([
            self.topMarginTarget.to(first.topTarget).with(1),
            first.bottomTarget.to(second.topTarget).with(2),
            second.bottomTarget.to(third.topTarget).with(2),
            third.bottomTarget.to(self.bottomTarget).with(1),
        ], in: self)
    }
}
