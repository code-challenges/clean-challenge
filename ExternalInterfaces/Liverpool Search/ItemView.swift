//
//  ItemView.swift
//  Liverpool Search
//
//  Created by Julio Cesar Guzman Villanueva on 12/1/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import Foundation
import UIKit

struct ItemViewModel {
    let top: String
    let middle: String
    let bottom: String
    let data: Data
}

class ItemView: UIView {
    @IBOutlet private weak var label1: UILabel?
    @IBOutlet private weak var label2: UILabel?
    @IBOutlet private weak var label3: UILabel?
    @IBOutlet private weak var image: UIImageView?
    
    func fill(with viewModel: ItemViewModel) {
        label1?.text = viewModel.top
        label2?.text = viewModel.middle
        label3?.text = viewModel.bottom
        image?.image = UIImage(data: viewModel.data)
    }
}
