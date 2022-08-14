//
//  SearchDetailViewController.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/14.
//

import UIKit
import Combine
import SwiftUI

final class SearchDetailViewController: UIViewController, ViewControllerBase {
    
    var viewModel: SearchDetailViewModel!
    private var cancelables = Set<AnyCancellable>()
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet private weak var contentView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        bind()
        viewModel.viewDidLoad()
    }
    
    func initialize() {
        title = "Detail"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func bind() {
        viewModel.$data
            .receive(on: DispatchQueue.main)
            .sink { [weak self] data in
                guard let sSelf = self,
                      let data = data else { return }
                sSelf.stackView.arrangedSubviews.forEach {
                    sSelf.stackView.removeArrangedSubview($0)
                    $0.removeFromSuperview()
                }
                sSelf.stackView.addArrangedSubview(sSelf.setupView(data: data))
            }.store(in: &cancelables)
    }
    
    /*
     # StoryBoardでは以下の実装を行なっている
       - 画面全体にScrollViewを貼る
       - その上にStackViewを入れる
       - その上にcontentViewというUIViewを入れる
       - その上にSwiftUIのViewを貼っている
     
     */
    private func setupView(data: Repository) -> UIView {
        let hostingViewController = UIHostingController(rootView: DetailView(data: data))
        self.addChild(hostingViewController)
        contentView.addSubview(hostingViewController.view)
        hostingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingViewController.view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        hostingViewController.view.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        hostingViewController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        hostingViewController.view.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        hostingViewController.didMove(toParent: parent)
        
        return contentView
    }
}

extension SearchDetailViewController: SearchDetailRouter {}
