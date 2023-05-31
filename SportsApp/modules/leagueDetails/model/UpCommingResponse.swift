//
//  UpCommingEvent.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 21/05/2023.
//

import Foundation


class UpComingResponse : Decodable {
    
    var result : [UpCommingEventResult]
    var success : Int?
    init(result: [UpCommingEventResult], success: Int? = nil) {
        self.result = result
        self.success = success
    }
}

class UpCommingEventResult : Decodable{
    var event_date : String?
    var event_time: String?
    var event_home_team : String?
    var event_away_team : String?
    var home_team_logo : String?
    var away_team_logo : String?
    var home_team_key : Int?
    var away_team_key : Int?
    var event_final_result : String?
    
    enum CodingKeys : String, CodingKey{
        case  event_date, event_time
        case event_home_team, event_away_team
        case home_team_logo
        case away_team_logo
        case home_team_key
        case away_team_key
        case event_final_result
        case event_home_team_logo, event_away_team_logo

        
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.event_date = try container.decodeIfPresent(String.self, forKey: .event_date)
        self.event_time = try container.decodeIfPresent(String.self, forKey: .event_time)
        self.event_home_team = try container.decodeIfPresent(String.self, forKey: .event_home_team)
        self.event_away_team = try container.decodeIfPresent(String.self, forKey: .event_away_team)
        self.home_team_key = try container.decodeIfPresent(Int.self, forKey: .home_team_key)
        self.away_team_key = try container.decodeIfPresent(Int.self, forKey: .away_team_key)
        self.home_team_logo = try container.decodeIfPresent(String.self, forKey: .home_team_logo) ?? container.decodeIfPresent(String.self, forKey: .event_home_team_logo)
        self.away_team_logo = try container.decodeIfPresent(String.self, forKey: .away_team_logo) ?? container.decodeIfPresent(String.self, forKey: .event_away_team_logo)
        self.event_final_result = try container.decodeIfPresent(String.self, forKey: .event_final_result)
    }
}
