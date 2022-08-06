//
//  TopViewController.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/06.
//

import Foundation
import UIKit

final class TopViewController: UIViewController {
    
    var viewModel: TopViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
}

extension TopViewController: TopRouter {}
