//
//  SettingRouter.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/11.
//

import UIKit

protocol SettingRouter: AnyObject {
    func goToSample(text: String)
    
}

extension SettingRouter where Self: UIViewController {
    func goToSample(text: String) {
        let vc = SampleViewController(rootView: SampleView(text: text))
        navigationController?.pushViewController(vc, animated: true)
    }
}
