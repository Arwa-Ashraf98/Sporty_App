//
//  TeanDetails.swift
//  SportsApp
//
//  Created by Arwa on 20/05/2023.
//

import Foundation


class TeamHelper {
    func teamDetailsFoot(teamKey:String)->String
     {
         return "https://apiv2.allsportsapi.com/football/?met=Teams&teamId=\(teamKey)&APIkey=\(Constants.apiKey)"
     }
       func teamDetailsBasket(teamKey:String)->String
     {
         return "https://apiv2.allsportsapi.com/basketball/?met=Teams&teamId=\(teamKey)&APIkey=\(Constants.apiKey)"
     }
       func teamDetailsCricket(teamKey:String)->String
     {
         return "https://apiv2.allsportsapi.com/cricket/?met=Teams&teamId=\(teamKey)&APIkey=\(Constants.apiKey)"
     }
       func teamDetailsTennis(teamKey:String)->String
     {
         return "https://apiv2.allsportsapi.com/tennis/?met=Teams&teamId=\(teamKey)&APIkey=\(Constants.apiKey)"
     }
     //leagues
    
     class SportsLeagues {
         
          static let Football = "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=\(Constants.apiKey)"
           static let Basketball = "https://apiv2.allsportsapi.com/basketball/?met=Leagues&APIkey=\(Constants.apiKey)"
           static let Cricket = "https://apiv2.allsportsapi.com/cricket/?met=Leagues&APIkey=\(Constants.apiKey)"
           static let Tennis = "https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=\(Constants.apiKey)"
     }
     //leagues
       func FootballLeagues()->String{
         return "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=\(Constants.apiKey)"
     }
       func CricketLeagues()->String{
         return "https://apiv2.allsportsapi.com/cricket/?met=Leagues&APIkey=\(Constants.apiKey)"
     }
       func BasketballLeagues()->String{
         return "https://apiv2.allsportsapi.com/basketball/?met=Leagues&APIkey=\(Constants.apiKey)"
     }
       func TennisLeagues()->String{
         return "https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=\(Constants.apiKey)"
     }
     //League Details
     //events
       func FootballUpcomingEvents(leagueKey:String)->String{
         return "https://apiv2.allsportsapi.com/football/?met=Fixtures&leagueId=\(leagueKey)&from=2023-01-18&to=2024-01-18&APIkey=\(Constants.apiKey)"
     }
     
       func BasketballUpcomingEvents(leagueKey:String)->String{
         return "https://apiv2.allsportsapi.com/basketball/?met=Fixtures&leagueId=\(leagueKey)&from=2023-01-18&to=2024-01-18&APIkey=\(Constants.apiKey)"
     }
       func CricketUpcomingEvents(leagueKey:String)->String{
         return "https://apiv2.allsportsapi.com/cricket/?met=Fixtures&leagueId=\(leagueKey)&from=2023-01-18&to=2024-01-18&APIkey=\(Constants.apiKey)"
     }
       func TennisUpcomingEvents(leagueKey:String)->String{
         return "https://apiv2.allsportsapi.com/tennis/?met=Fixtures&leagueId=\(leagueKey)&from=2023-01-18&to=2024-01-18&APIkey=\(Constants.apiKey)"
     }
     func FootballLatestEvents(leagueKey:String)->String{
       return "https://apiv2.allsportsapi.com/football/?met=Fixtures&leagueId=\(leagueKey)&from=2022-01-18&to=2023-01-18&APIkey=\(Constants.apiKey)"
   }
   
     func BasketballLatestEvents(leagueKey:String)->String{
       return "https://apiv2.allsportsapi.com/basketball/?met=Fixtures&leagueId=\(leagueKey)&from=2022-01-18&to=2023-01-18&APIkey=\(Constants.apiKey)"
   }
     func CricketLatestEvents(leagueKey:String)->String{
       return "https://apiv2.allsportsapi.com/cricket/?met=Fixtures&leagueId=\(leagueKey)&from=2022-01-18&to=2023-01-18&APIkey=\(Constants.apiKey)"
   }
     func TennisLatestEvents(leagueKey:String)->String{
       return "https://apiv2.allsportsapi.com/tennis/?met=Fixtures&leagueId=\(leagueKey)&from=2022-01-18&to=2023-01-18&APIkey=\(Constants.apiKey)"
   }
     //latest results
     
       func FootballLeagueLatestResult(leagueKey:String)->String{
         return "https://apiv2.allsportsapi.com/football?met=Fixtures&leagueId=\(leagueKey)&from=2023-01-18&to=2024-01-18&APIkey=\(Constants.apiKey)"
     }
       func BasketballLeagueLatestResult(leagueKey:String)->String{
         return "https://apiv2.allsportsapi.com/basketball?met=Fixtures&leagueId=\(leagueKey)&from=2023-01-18&to=2024-01-18&APIkey=\(Constants.apiKey)"
     }
       func CricketLeagueLatestResult(leagueKey:String)->String{
         return "https://apiv2.allsportsapi.com/cricket?met=Fixtures&leagueId=\(leagueKey)&from=2023-01-18&to=2024-01-18&APIkey=\(Constants.apiKey)"
     }
       func TennisLeagueLatestResult(leagueKey:String)->String{
         return "https://apiv2.allsportsapi.com/tennis?met=Fixtures&leagueId=\(leagueKey)&from=2023-01-18&to=2024-01-18&APIkey=\(Constants.apiKey)"
     }
     
     //team details
     
    static func getTeamDetailsUrl(teamKey:Int , sportsName : String)->String{
      return "https://apiv2.allsportsapi.com/\(sportsName)/?&met=Teams&teamId=\(teamKey)&APIkey=\(Constants.apiKey)"
     }
    
    
       func BasketballTeamDetails(teamKey:String)->String{
      return "https://apiv2.allsportsapi.com/basketball/?&met=Teams&teamId=\(teamKey)&APIkey=\(Constants.apiKey)"
     }
       func CricketTeamDetails(teamKey:String)->String{
      return "https://apiv2.allsportsapi.com/cricket/?&met=Teams&teamId=\(teamKey)&APIkey=\(Constants.apiKey)"
     }
       func TennisPlayerDetails(playerKey:String)->String{
      return
       "https://apiv2.allsportsapi.com/tennis/?&met=Players&playerId=\(playerKey)&APIkey=\(Constants.apiKey)"
           
     }
    
    
    
    
}
