//
//  SettingViewController.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/11.
//

import UIKit

final class SettingViewController: UIViewController {
    
    var viewModel: SettingViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SettingViewController: SettingRouter {
    
}
