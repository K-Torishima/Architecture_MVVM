//
//  UIView+Layout.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/11.
//

import Foundation
import UIKit

extension UIView {
    func edges(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    func addAutoResizingSubView(_ view: UIView) {
        view.removeFromSuperview()
        addSubview(view)
        view.edges(to: self)
    }
    
    func setY(_ y: CGFloat) {
        frame = CGRect(x: frame.minX, y: y, width: frame.width, height: frame.height)
    }
    
    func setWidth(_ width: CGFloat) {
        frame = CGRect(x: frame.minX, y: frame.minY, width: width, height: frame.height)
    }
    
    func setHeight(_ height: CGFloat) {
        frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height:  height)
    }
}
