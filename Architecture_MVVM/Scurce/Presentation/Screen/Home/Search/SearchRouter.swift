//
//  SearchRouter.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/11.
//

import Foundation
import UIKit

protocol SearchRouter: AnyObject {
    func goToSearchDetail(data: Repository)
}

extension SearchRouter where Self: UIViewController {
    func goToSearchDetail(data: Repository) {
        let viewController = SearchDetailViewController.instantiate()
        viewController.viewModel.set(transitionEntity: SearchDetailTransitionEntity(data: data))
        navigationController?.pushViewController(viewController, animated: true)
    }
}
