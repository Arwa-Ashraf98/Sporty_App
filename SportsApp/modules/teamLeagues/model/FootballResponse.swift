//
//  FootballResponse.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 21/05/2023.
//

import Foundation


struct FootBallResponse: Codable {
    let success: Int
    let result: [FootballResult]
}

// MARK: - Result For football
struct FootballResult: Codable {
    let leagueKey: Int
    let leagueName: String
    let countryKey: Int
    let countryName: String
    let leagueLogo, countryLogo: String?

    enum CodingKeys: String, CodingKey {
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case countryKey = "country_key"
        case countryName = "country_name"
        case leagueLogo = "league_logo"
        case countryLogo = "country_logo"
    }
}

