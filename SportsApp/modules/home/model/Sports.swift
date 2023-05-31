//
//  Sports.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 21/05/2023.
//

import Foundation
import UIKit


class Sports {
    var sportsName : String?
    var sportImage : UIImage
    
    init(sportsName: String? = nil, sportImage: UIImage) {
        self.sportsName = sportsName
        self.sportImage = sportImage
    }
}
