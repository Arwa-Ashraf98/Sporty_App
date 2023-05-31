//
//  CricketResponse.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 21/05/2023.
//

import Foundation


struct CricketResponse: Codable {
    let success: Int
    let result: [CricketResult]
}

// MARK: - Result
struct CricketResult: Codable {
    let leagueKey: Int
    let leagueName, leagueYear: String

    enum CodingKeys: String, CodingKey {
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case leagueYear = "league_year"
    }
}
