//
//  TeamDetailsCell.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 23/05/2023.
//

import UIKit

class TeamDetailsCell: UITableViewCell {
    @IBOutlet weak var playerName: UILabel!
    
    
    @IBOutlet weak var playerImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
