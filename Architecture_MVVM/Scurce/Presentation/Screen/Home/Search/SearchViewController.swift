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
    
    @IBOutlet private weak var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
        }
    }
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerCell(SearchTableViewCell.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        bind()
        viewModel.viewDidLoard()
    }
    
    private func initialize() {
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func bind() {
        viewModel.$displayState
            .receive(on: DispatchQueue.main)
            .sink { state in
                switch state {
                case .initial:
                    print("initial")
                case .main:
                    print("main")
                }
            }.store(in: &cancelables)
        viewModel.$progressState
            .receive(on: DispatchQueue.main)
            .sink { state in
                switch state {
                case .none:
                    print("none")
                case .fetch:
                    print("fetch")
                }
            }.store(in: &cancelables)
        viewModel.$datasource
            .receive(on: DispatchQueue.main)
            .sink { _ in
                self.tableView.reloadData()
            }.store(in: &cancelables)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text,
              !searchText.isEmpty else {
            return
        }
        viewModel.apply(searchText: searchText)
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftUI
        //let cell = HostingTableViewCell<SearchRowView>()
        //cell.hosting(SearchRowView(data: viewModel.datasource[indexPath.row]), parent: self)
        
        // UIKit
        let cell: SearchTableViewCell = tableView.dequeue(indexPath: indexPath)
        cell.apply(data: viewModel.datasource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRowAt(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SearchViewController: SearchRouter {
    
}

// ---------------------------------------------------------------- //
/*
 UISearchControllerを使うときは以下のような動きをする
 表示されている画面の階層の上に新しいコントローラー画面を出現させることができる
 検索してその画面で表示するだけの場合は、UISearchControllerで対応しなくても良い
 
 UISearchControllerの動きは検索する前の画面と検索結果を出す画面が別の場合に有効
 一枚の検索リスト画面の場合は、SearchBarだけの組み合わせの方が良い
 TableViewを組み合わせたりするとSearchBarが表示されなくなってしまう
 
 */

//private var searchController: UISearchController!
//
//private func setupSearchController() {
//    // 検索結果を別の画面に表示することができる
//    // 検索結果表示用画面が特になければ、ここは入れなくて良い
//    // 検索結果と初期表示の内容を分けたければ別で良さそう
//    searchController = UISearchController(searchResultsController: nil)
//    searchController.delegate = self
//    searchController.searchBar.delegate = self
//    // フォーカスの色と、キャンセルの文言の色が変わる
//    searchController.searchBar.tintColor = .lightGray
//    navigationItem.searchController = searchController
//}

//extension SearchViewController: UISearchControllerDelegate {
//    func presentSearchController(_ searchController: UISearchController) {
//        //print("searchbarをタップして一番最初に起動")
//    }
//
//    func willPresentSearchController(_ searchController: UISearchController) {
//        //print("presentSearchControllerメソッドの後に呼ばれる")
//    }
//
//    func didPresentSearchController(_ searchController: UISearchController) {
//        //print("フォーカス当た理終わってキーボード開いたら")
//    }
//
//    func willDismissSearchController(_ searchController: UISearchController) {
//        //print("キャンセルボタンを押してすぐ")
//    }
//
//    func didDismissSearchController(_ searchController: UISearchController) {
//        //print("キーボード閉じ終わってから")
//    }
//}
