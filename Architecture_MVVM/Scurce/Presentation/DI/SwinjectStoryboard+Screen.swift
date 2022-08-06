//
//  SwinjectStoryboard+Screen.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/06.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setupScreen() {
        defaultContainer.storyboardInitCompleted(TopViewController.self) { r, vc in
            vc.viewModel = r.resolve(TopViewModel.self)!
            vc.viewModel.set(router: vc)
        }
        defaultContainer.register(TopViewModel.self) { r in
            TopViewModel()
        }
    }
}
