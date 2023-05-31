//
//  LeaguesViewModel.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 21/05/2023.
//

import Foundation
class LeaguesViewModel {
    var bindFootballResultToViewController : (() -> ()) = { }
    var bindBasketballResultToViewController : (() -> ()) = { }
    var bindTennisResultToViewController : (() -> ()) = { }
    var bindCricketResultToViewController : (() -> ()) = { }
    
    var leagueNetworkService : LeaguesNetworkServiceProtocol
    init(leagueNetowrkService : LeaguesNetworkServiceProtocol){
        self.leagueNetworkService = leagueNetowrkService
    }
    
    var footBallLaeguesResult : [FootballResult]! {
        didSet {
            bindFootballResultToViewController()
        }
    }
    
    var basketBallLaeguesResult : [BascketballResult]! {
        didSet {
            bindBasketballResultToViewController()
        }
    }
    
    var tennisLaeguesResult : [TennisesResult]! {
        didSet {
            bindTennisResultToViewController()
        }
    }
    
    var cricketLaeguesResult : [CricketResult]! {
        didSet {
            bindCricketResultToViewController()
        }
    }
    
    
    
    func getFootballLeagues(){
        leagueNetworkService.getFootBallData {[weak self] (footballResponse : FootBallResponse?) in
            self!.footBallLaeguesResult = footballResponse?.result
            print("in view model \(String(describing: footballResponse?.result[0].leagueName))")
        }
    }
    
    
    
    
    func getCricketLeagues(){
        leagueNetworkService.getCricketData {[weak self] (cricketResponse : CricketResponse?) in
            self!.cricketLaeguesResult = cricketResponse?.result
            print("in view model \(String(describing: cricketResponse?.result[0].leagueName))")

        }
    }

    func getBasketBallLeagues(){
        leagueNetworkService.getBasketBallData {[weak self] (basketballResponse : BasketResponse?) in
            self!.basketBallLaeguesResult = basketballResponse?.result
            print("in view model \(String(describing: basketballResponse?.result[0].leagueName))")
        }
    }

    func getTennisLeagues(){
        leagueNetworkService.getTennisData {[weak self] (tennisResponse : TennisResponse?) in
            self!.tennisLaeguesResult = tennisResponse?.result
            print("in view model \(String(describing: tennisResponse?.result[0].leagueName))")
        }
    }
}
