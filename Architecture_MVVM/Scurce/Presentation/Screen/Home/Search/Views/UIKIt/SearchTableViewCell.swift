//
//  SearchTableViewCell.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/14.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    
    @IBOutlet private weak var previewLabel: UILabel!
    
    func apply(data: Repository) {
        previewLabel.text = "\(data)"
    }
}
