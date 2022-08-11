//
//  SearchViewController.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/11.
//

import UIKit

final class SearchViewController: UIViewController {
    
    var viewModel: SearchViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoard()
    }
    
}


extension SearchViewController: SearchRouter {
    
}
