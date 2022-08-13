//
//  HostingTableViewCell.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/13.
//

import UIKit
import SwiftUI



// 読み込み自体はできるけど変な挙動するので謎
// 一旦やめる

final class HostingTableViewCell<Content: View>: UITableViewCell {
    
    private weak var hostingController: UIHostingController<Content>?
    
    func hosting(_ view: Content, parent: UIViewController) {
        if let hostingController = hostingController {
            hostingController.rootView = view
            hostingController.view.layoutIfNeeded()
        } else {
            
            let swiftUICellViewController = UIHostingController(rootView: view)
            hostingController = swiftUICellViewController
            swiftUICellViewController.view.backgroundColor = .clear

            layoutIfNeeded()
            
            parent.addChild(swiftUICellViewController)
            contentView.addSubview(swiftUICellViewController.view)
            swiftUICellViewController.view.translatesAutoresizingMaskIntoConstraints = false
            swiftUICellViewController.view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            swiftUICellViewController.view.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
            swiftUICellViewController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            swiftUICellViewController.view.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
            
            swiftUICellViewController.didMove(toParent: parent)
            swiftUICellViewController.view.layoutIfNeeded()
        }
    }
}
