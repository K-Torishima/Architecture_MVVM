//
//  NSObject+Extentions.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/11.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
}
