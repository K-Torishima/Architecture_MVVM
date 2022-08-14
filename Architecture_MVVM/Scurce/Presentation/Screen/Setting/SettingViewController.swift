//
//  SettingViewController.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/11.
//

import UIKit
import SwiftUI

// SwiftUIのViewを呼び出している
// NavigationとかはUIViewControllerを使う

final class SettingViewController: UIViewController {
    
    var viewModel: SettingViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Setting"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let settingView: SettingView = SettingView(handler: { [weak self] event in
            switch event {
            case .cell1:
                print("cell tap ")
                // これで画面遷移はできる
                self?.viewModel.test()
            case .cell2:
                break
            case .cell3:
                break
            }
            
        })
        let hostingController = UIHostingController(rootView: settingView)
        viewDidLayoutSubviews()
        
        self.addChild(hostingController)
        self.view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        hostingController.didMove(toParent: self)
        hostingController.view.layoutIfNeeded()
    }
}

extension SettingViewController: SettingRouter {
    
}
