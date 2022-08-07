//
//  SwinjectStoryboard+Data.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/07.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setupServices() {
        defaultContainer.register(APIService.self) { r in
            APIServiceImpl(session: .shared)
        }
    }
    
    class func setupRepositories() {
        defaultContainer.register(SearchRepository.self) { r in
            SearchRepositoryImpl(apiService: r.resolve(APIService.self)!)
        }
    }
}
