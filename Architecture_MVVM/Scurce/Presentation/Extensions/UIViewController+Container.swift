//
//  UIViewController+Container.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/11.
//

import Foundation

import UIKit

extension UIViewController {
    func addChildViewController(_ viewController: UIViewController, to targetView: UIView) {
        guard !children.contains(viewController) else { return }
        addChild(viewController)
        targetView.addSubview(viewController.view)
        viewController.view.edges(to: targetView)
        viewController.didMove(toParent: self)
    }
    
    // 画面を置き換える、全てを消してから再度add
    func replaceChildViewController(_ viewController: UIViewController, to targetView: UIView) {
        children.forEach { $0.removeFromSuperContainerViewController() }
        addChildViewController(viewController, to: targetView)
    }

    func removeFromSuperContainerViewController() {
        view.layer.removeAllAnimations()
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

