//
//  TopViewController.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/06.
//

import UIKit
import Combine

final class TopViewController: UIViewController {
    
    var viewModel: TopViewModel!
    private var cancelables = Set<AnyCancellable>()
    private let tabController = UITabBarController()
    private var navControllers: [TopViewModel.TabIndexType: UINavigationController] = [:]
    
    @IBOutlet private weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        initialize()
        bind()
    }
    
    private func initialize() {
        tabController.delegate = self
        addChildViewController(tabController, to: containerView)
    }
    
    private func bind() {
        viewModel.$desplayState
            .sink() { state in
                switch state {
                case .initial:
                    print("initial")
                case .main:
                    print("main")
                }
            }.store(in: &cancelables)
        viewModel.$tabItems
            .sink() { itams in
                guard let items = itams else { return }
                var viewControllers: [UIViewController] = []
                items.forEach { item in
                    let navigationController = self.createNavigationController(from: item)
                    self.navControllers[item.index] = navigationController
                    viewControllers.append(navigationController)
                }
                self.tabController.setViewControllers(viewControllers, animated: false)
            }.store(in: &cancelables)
    }
    
    private func createNavigationController(from tabItem: TopViewModel.TabItem) -> UINavigationController {
        var rootViewController: UIViewController? = nil
        switch tabItem.index {
        case .home:
            rootViewController = SearchViewController.instantiate()
            rootViewController?.title = "Search"
        case .setting:
            rootViewController = SettingViewController.instantiate()
            rootViewController?.title = "Setting"
        }
        let naviController = UINavigationController(rootViewController: rootViewController!)
        naviController.tabBarItem = UITabBarItem(title: tabItem.title,
                                                 image: UIImage(systemName: tabItem.imageName),
                                                 selectedImage: UIImage(systemName: tabItem.selectedImageName))
        return naviController
    }
}


extension TopViewController: UITabBarControllerDelegate {
}

extension TopViewController: TopRouter {}
