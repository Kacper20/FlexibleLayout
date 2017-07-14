//
//  ViewController.swift
//  FlexibleLayoutExample
//
//  Created by Kacper Harasim on 14/07/2017.
//  Copyright © 2017 Harasim. All rights reserved.
//

import UIKit

enum LayoutExample: Int {
    case verticalDistribution = 0
    case horizontalDistribution = 1
    case horizontalCentering = 2
}

class ViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let example = LayoutExample(rawValue: indexPath.row) else { return }
        presentVC(with: viewCreation(for: example))
    }

    private func viewCreation(for example: LayoutExample) -> () -> UIView {
        switch example {
        case .verticalDistribution:
            return { return VerticalDistributionView() }
        case .horizontalDistribution:
            return { return UIView() }
        case .horizontalCentering:
            return { return UIView() }
        }
    }

    private func presentVC(with viewCreation: @escaping () -> UIView) {
        let vc = ViewInjectableViewController(viewCreation: viewCreation)
        navigationController?.pushViewController(vc, animated: true)
    }
}

