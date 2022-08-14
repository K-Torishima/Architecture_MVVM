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
        //MARK: - Top
        defaultContainer.storyboardInitCompleted(TopViewController.self) { r, vc in
            vc.viewModel = r.resolve(TopViewModel.self)!
            vc.viewModel.set(router: vc)
        }
        defaultContainer.register(TopViewModel.self) { r in
            TopViewModel()
        }
        //MARK: - Home
        defaultContainer.storyboardInitCompleted(SearchViewController.self) { r, vc in
            vc.viewModel = r.resolve(SearchViewModel.self)!
            vc.viewModel.set(router: vc)
        }
        defaultContainer.register(SearchViewModel.self) { r in
            SearchViewModel(searchRepository: r.resolve(SearchRepository.self)!)
        }
        defaultContainer.storyboardInitCompleted(SearchDetailViewController.self) { r, vc in
            vc.viewModel = r.resolve(SearchDetailViewModel.self)!
            vc.viewModel.set(router: vc)
        }
        defaultContainer.register(SearchDetailViewModel.self) { r in
            SearchDetailViewModel()
        }
        //MARK: - Setting
        defaultContainer.storyboardInitCompleted(SettingViewController.self) { r, vc in
            vc.viewModel = r.resolve(SettingViewModel.self)!
            vc.viewModel.set(router: vc)
        }
        defaultContainer.register(SettingViewModel.self) { r in
            SettingViewModel()
        }
    }
}
