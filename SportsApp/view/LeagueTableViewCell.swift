//
//  LeagueTableViewCell.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 24/05/2023.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak var teamLeagueImage: UIImageView!
    @IBOutlet weak var teamLeagueName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.addBorderAndColor(20, 1, .green)
    }
}
