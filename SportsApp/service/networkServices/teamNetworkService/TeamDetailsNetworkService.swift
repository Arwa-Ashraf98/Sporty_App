//
//  TeamDetailsNetworkService.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 23/05/2023.
//

import Foundation
import Alamofire

class TeamDetailsNetworkService : TeamDetailsNetworkServiceProtocol {
    static let instance = TeamDetailsNetworkService()
    func getTeamDetailsData(forTeamID teamID: Int, forSport sport: String, completion: @escaping (TeamResponse?, Error?) -> Void) {
        let url = TeamHelper.getTeamDetailsUrl(teamKey: teamID, sportsName: sport)
        AF.request(url , method: .get , parameters: nil , encoding : URLEncoding.default , headers : nil , interceptor : nil).response {responce in
            switch responce.result {
            case .success(let data):
                do {
                    let jsondata = try JSONDecoder().decode(TeamResponse.self, from: data!)
                    completion(jsondata, nil)
                }catch {
                    print(error.localizedDescription)
                }
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
      
    
}
