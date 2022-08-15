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
                self?.viewModel.goToSample(text: "cell 1からの画面遷移")
            case .cell2:
                self?.viewModel.goToSample(text: "cell 2からの画面遷移")
            case .cell3:
                self?.viewModel.goToSample(text: "cell 3からの画面遷移")
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
