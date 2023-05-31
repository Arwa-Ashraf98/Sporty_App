//
//  LeagueDetailsViewModel.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 21/05/2023.
//

import Foundation

class LeagueDetailsViewModel {
    var bindFixtureDataResultToViewController : (() -> ()) = { }
    var bindLatestEventResultToViewController : (() -> ()) = { }
    var bindTeamsToViewController : (() -> ()) = { }
    var flag = false
    var falg2 = false
    var databaseManager : DatabaseManager
    var leagueNetworkService : LeagueDetailsNetworkSericeProtocol
    
    
    init(leagueNetowrkService : LeagueDetailsNetworkSericeProtocol , database : DatabaseManager){
        self.leagueNetworkService = leagueNetowrkService
        self.databaseManager = database
    }
    
    var fixtureLaeguesResult : [UpCommingEventResult]! {
        didSet {
            flag = true
            bindFixtureDataResultToViewController()
        }
    }
    
    var latestEventResult : [UpCommingEventResult]! {
        didSet {
            falg2 = true
            bindLatestEventResultToViewController()
        }
    }
    
    var teamsResult : [LeagueTeams]! {
        didSet {
            bindTeamsToViewController()
        }
    }
    
    func getFuxtureData(leagueId : Int , sportsName : String){
        let today = Date()
        let nextYear = Calendar.current.date(byAdding: .year, value: 1, to: today)!
        
        leagueNetworkService.getFixtureData(forLeagueID: leagueId, forSport: sportsName, fromDate: today, toDate: nextYear) { response , error in

            if let error = error {
           
                    return
                
            }
            
            guard let response = response else {
                self.fixtureLaeguesResult = nil
                return
            }
            self.fixtureLaeguesResult = response.result
        }
    }
    
    func getLatestEventData(leagueId : Int , sportsName : String){
        let today = Date()
        let prevYear = Calendar.current.date(byAdding: .year, value: -1, to: today)!
        

        leagueNetworkService.getLatestEventData(forLeagueID: leagueId, forSport: sportsName, fromDate: prevYear, toDate: today) { response , error in

            if let error = error {
           
                    return
                
            }
            
            guard let response = response else {
                self.latestEventResult = nil
                return
            }
            self.latestEventResult = response.result
        }
    }
    
    func getTeams(){
        
        var mySet : Set<LeagueTeams> = []
        for upCommingItem in fixtureLaeguesResult {
          var homeTeam = LeagueTeams()
          var awayTeam = LeagueTeams()
          awayTeam.image = upCommingItem.event_away_team
          awayTeam.name = upCommingItem.event_away_team
          awayTeam.teamKey = upCommingItem.away_team_key
          homeTeam.name = upCommingItem.event_home_team
          homeTeam.image = upCommingItem.home_team_logo
          homeTeam.teamKey = upCommingItem.home_team_key
            mySet.insert(awayTeam)
            mySet.insert(homeTeam)
        }
        
        for latestEventItem in latestEventResult {
          var homeTeam = LeagueTeams()
          var awayTeam = LeagueTeams()
          awayTeam.image = latestEventItem.event_away_team
          awayTeam.name = latestEventItem.event_away_team
          awayTeam.teamKey = latestEventItem.away_team_key
          homeTeam.name = latestEventItem.event_home_team
          homeTeam.image = latestEventItem.home_team_logo
          homeTeam.teamKey = latestEventItem.home_team_key
            mySet.insert(awayTeam)
            mySet.insert(homeTeam)
        }
        
        teamsResult = Array(mySet)
    }
    
    func insertTeamToFavourite(item : FavoriteTeam){
        do {
            try? databaseManager.insertData(item: item)
        }
    }
    
    func chechIfIsExist(item : FavoriteTeam) -> Bool {
        var isExist : Bool?
        do {
            isExist = try? databaseManager.isExistItem(item: item)
        }
        return isExist ?? false
    }
    
}
