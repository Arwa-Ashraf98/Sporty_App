//
//  TeamDetailsNetworkServiceProtocol.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 23/05/2023.
//

import Foundation

protocol TeamDetailsNetworkServiceProtocol{
    func getTeamDetailsData(forTeamID teamID: Int, forSport sport: String, completion: @escaping (TeamResponse?, Error?) -> Void) 
}
