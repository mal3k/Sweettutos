//
//  UITableView+Extensions.swift
//  SampleApp
//
//  Created by Malek TRABELSI on 31/12/2022.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifie: \(T.identifier)")
        }
        return cell
    }
}

extension UITableViewCell {
    static var identifier: String {
        String(describing: self)
    }
}
