//
//  LeaguesNetworkServiceProtocol.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 21/05/2023.
//

import Foundation

protocol LeaguesNetworkServiceProtocol {
    func getFootBallData(handler : @escaping(_ apiData:FootBallResponse?) -> (Void))
    func getCricketData(handler : @escaping(_ apiData:CricketResponse) -> (Void))
    func getBasketBallData(handler : @escaping(_ apiData:BasketResponse) -> (Void))
    func getTennisData(handler : @escaping(_ apiData:TennisResponse) -> (Void))
}
