//
//  SettingRouter.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/11.
//

import UIKit

protocol SettingRouter: AnyObject {
    func goToTest()
    
}

extension SettingRouter where Self: UIViewController {
    func goToTest() {
        let vc = SearchViewController.instantiate()
        navigationController?.pushViewController(vc, animated: true)
    }
}
