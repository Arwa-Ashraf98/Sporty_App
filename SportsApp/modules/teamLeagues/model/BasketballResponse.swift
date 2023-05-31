//
//  BasketballResponse.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 21/05/2023.
//

import Foundation


struct BasketResponse : Codable {
    let success: Int
    let result: [BascketballResult]
    
}

struct BascketballResult: Codable {
    let leagueKey: Int
       let leagueName: String
       let countryKey: Int
       let countryName: String

       enum CodingKeys: String, CodingKey {
           case leagueKey = "league_key"
           case leagueName = "league_name"
           case countryKey = "country_key"
           case countryName = "country_name"
       }
}
