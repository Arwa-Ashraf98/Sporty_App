//
//  LeagueDetailsNetworkServiceProtocol.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 21/05/2023.
//

import Foundation


protocol LeagueDetailsNetworkSericeProtocol {
    func getFixtureData (forLeagueID leagueID: Int, forSport sport: String, fromDate: Date, toDate: Date, completion: @escaping (UpComingResponse?, Error?) -> Void)
    
    func getLatestEventData (forLeagueID leagueID: Int, forSport sport: String, fromDate: Date, toDate: Date, completion: @escaping (UpComingResponse?, Error?) -> Void)
}
