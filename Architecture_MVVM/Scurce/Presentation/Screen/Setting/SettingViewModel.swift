//
//  SettingViewModel.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/11.
//

import Foundation

final class SettingViewModel {
    
    private weak var router: SettingRouter?
    
    func viewDidLoad() {
    }
    
    func set(router: SettingRouter) {
        self.router = router
    }
}
