//
//  TopViewModel.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/06.
//

import Foundation

@MainActor
final class TopViewModel {
    
    enum DisplayState {
        case initial
        case main
    }
    
    enum TabIndexType: Int {
        case home = 0
        case setting
        
        func title() -> String {
            switch self {
            case .home:
                return "home"
            case .setting:
                return "setting"
            }
        }
        
        // imageSystemNameを返している
        // Assetsから呼び出しても良い
        func image() -> String {
            switch self {
            case .home:
                return "house"
            case .setting:
                return "gearshape"
            }
        }
        
        // imageSystemNameを返している
        // Assetsから呼び出しても良い
        func selectedImage() -> String {
            switch self {
            case .home:
                return "house.fill"
            case .setting:
                return "gearshape.fill"
            }
        }
    }
    
    struct TabItem {
        let index: TabIndexType
        let title: String
        let imageName: String
        let selectedImageName: String
    }
    
    @Published private (set) var desplayState: DisplayState = .initial
    @Published private (set) var tabItems: [TabItem]? = nil
    
    private weak var router: TopRouter?
    
    func viewDidLoad() {
        tabItems = [createTabItem(for: .home),
                    createTabItem(for: .setting)]
        desplayState = .main
        
    }
    
    func set(router: TopRouter) {
        self.router = router
    }
    
    private func createTabItem(for indexType: TabIndexType) -> TabItem {
        return TabItem(index: indexType, title: indexType.title(), imageName: indexType.image(), selectedImageName: indexType.selectedImage())
    }
}
