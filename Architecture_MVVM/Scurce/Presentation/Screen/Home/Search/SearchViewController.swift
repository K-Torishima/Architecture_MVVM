//
//  SearchViewController.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/11.
//

import UIKit
import Combine

final class SearchViewController: UIViewController {
    
    var viewModel: SearchViewModel!
    private var cancelables = Set<AnyCancellable>()
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
        viewModel.$displayState
            .sink { state in
                switch state {
                case .initial:
                    print("initial")
                case .main:
                    print("main")
                }
            }.store(in: &cancelables)
        viewModel.$progressState
            .sink { state in
                switch state {
                case .none:
                    print("none")
                case .fetch:
                    print("fetch")
                }
            }.store(in: &cancelables)
//        viewModel.isSearched
//            .sink { _ in
//
//
//            }.store(in: &cancelables)
        viewModel.$datasource
            .sink { datas in
                // リロード
                print(datas.count)
            }.store(in: &cancelables)
        
    }
    
    private func setupSearchController() {
        // 検索結果を別の画面に表示することができる
        // 検索結果表示用画面が特になければ、ここは入れなくて良い
        // 検索結果と初期表示の内容を分けたければ別で良さそう
        searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        searchController.searchBar.delegate = self
        // フォーカスの色と、キャンセルの文言の色が変わる
        searchController.searchBar.tintColor = .lightGray
        navigationItem.searchController = searchController
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            return
        }
        viewModel.apply(searchText: searchText)
    }
}

extension SearchViewController: SearchRouter {
    
}

// ---------------------------------------------------------------- //
/*
 UISearchControllerを使うときは以下のような動きをする
 表示されている画面の階層の上に新しいコントローラー画面を出現させることができる
 検索してその画面で表示するだけの場合は、UISearchControllerで対応しなくても良い
 
 */

extension SearchViewController: UISearchControllerDelegate {
    func presentSearchController(_ searchController: UISearchController) {
        //print("searchbarをタップして一番最初に起動")
    }
    
    func willPresentSearchController(_ searchController: UISearchController) {
        //print("presentSearchControllerメソッドの後に呼ばれる")
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        //print("フォーカス当た理終わってキーボード開いたら")
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        //print("キャンセルボタンを押してすぐ")
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        //print("キーボード閉じ終わってから")
    }
}
