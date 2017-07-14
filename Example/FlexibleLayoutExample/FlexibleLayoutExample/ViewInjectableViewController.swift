//
//  ViewInjectableViewController.swift
//  FlexibleLayoutExample
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import Foundation
import UIKit

final class ViewInjectableViewController: UIViewController {

    private let viewCreation: () -> UIView

    init(viewCreation: @escaping () -> UIView) {
        self.viewCreation = viewCreation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = viewCreation()
    }
}
