//
//  UICollectionView+Register.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/13.
//

import UIKit

extension UICollectionView {
    func dequeue<T: NibInstantiatable & NSObject>(indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.className, for: indexPath) as? T else {
            fatalError("\(self)のDequeに失敗")
        }
        return cell
    }
    
    func registerCell<T: UICollectionViewCell>(_: T.Type) {
        register(UINib(nibName: T.className, bundle: nil), forCellWithReuseIdentifier: T.className)
    }
}
