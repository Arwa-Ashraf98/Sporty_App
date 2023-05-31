//
//  HomeCollectionViewCell.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 21/05/2023.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak var sportsNameLabel: UILabel!
    @IBOutlet weak var sportsImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.addBorderAndColor(20, 1, .green)
    }
}
