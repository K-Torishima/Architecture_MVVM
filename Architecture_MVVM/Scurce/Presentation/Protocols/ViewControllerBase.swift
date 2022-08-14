//
//  ViewControllerBase.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/14.
//

import Foundation

protocol ViewControllerBase: AnyObject {
    func initialize()
    func bind()
}
