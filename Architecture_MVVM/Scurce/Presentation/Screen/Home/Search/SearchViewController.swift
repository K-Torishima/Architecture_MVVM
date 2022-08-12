//
//  SearchViewController.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/11.
//

import UIKit

final class SearchViewController: UIViewController {
    
    var viewModel: SearchViewModel!
    private var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        bind()
        viewModel.viewDidLoard()
    }
    
    private func initialize() {
        setupSearchController()
    }
    
    private func bind() {
        
    }
    
    private func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            return
        }
        
        print(searchText)
        // viewModelに渡す
    }
}

extension SearchViewController: UISearchControllerDelegate {
    func presentSearchController(_ searchController: UISearchController) {
        print("searchbarをタップして一番最初に起動")
    }
    
    func willPresentSearchController(_ searchController: UISearchController) {
        print("presentSearchControllerメソッドの後に呼ばれる")
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        print("フォーカス当た理終わってキーボード開いたら")
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        print("キャンセルボタンを押してすぐ")
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        print("キーボード閉じ終わってから")
    }
}

extension SearchViewController: SearchRouter {
    
}
