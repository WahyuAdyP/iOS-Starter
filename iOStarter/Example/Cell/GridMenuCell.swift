//
//  GridMenuCell.swift
//  iOStarter
//
//  Created by Crocodic MBP-2 on 25/07/18.
//  Copyright © 2018 WahyuAdyP. All rights reserved.
//

import UIKit

class GridMenuCell: UICollectionViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    
    var viewModel: MenuItemVM = MenuItemVM() {
        didSet {
            setupView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setupView() {
        titleLbl.text = viewModel.name
        iconView.image = viewModel.image
    }

}
