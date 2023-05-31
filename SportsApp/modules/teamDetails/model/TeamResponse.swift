//
//  TeamResponse.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 23/05/2023.
//

import Foundation

class TeamResponse : Decodable {
    var result : [TeamResult]
    var success : Int?
    init(result: [TeamResult], success: Int? = nil) {
        self.result = result
        self.success = success
    }
}
class TeamResult : Decodable {
    var team_key : Int?
    var team_name : String?
    var team_logo : String?
    var players : [Player]?
    var coaches : [Coach]?
    
    init(team_key: Int? = nil, team_name: String? = nil, team_logo: String? = nil, players: [Player]? = nil, coaches: [Coach]? = nil) {
        self.team_key = team_key
        self.team_name = team_name
        self.team_logo = team_logo
        self.players = players
        self.coaches = coaches
    }
}


class Coach : Decodable{
    var coach_name : String?
}

class Player :Decodable {
    var player_name : String?
    var player_type : String?
    var player_number : String?
    var player_image : String?
    var player_age : String?
}
