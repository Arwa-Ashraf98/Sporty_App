//
//  TeamDetailsViewModel.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 23/05/2023.
//

import Foundation

class TeamDetailsViewModel {
    
    var networkManager : TeamDetailsNetworkServiceProtocol
    var bindTeamDataResultToViewController : (() -> ()) = { }
   
    
    init(networkManager: TeamDetailsNetworkServiceProtocol) {
        self.networkManager = networkManager
    }
    
    var teamDetailsResult : [TeamResult]! {
        didSet {
            bindTeamDataResultToViewController()
        }
    }
    
    func getTeamDetailsData(teamId : Int , sportsName : String) {
        networkManager.getTeamDetailsData(forTeamID: teamId, forSport: sportsName) { response, error in
            if let error = error {
                print("Error fetching data:", error.localizedDescription)
                return
            }
            
            guard let response = response else {
                print("no response found")
                return
            }
            self.teamDetailsResult = response.result
            print("in view model \(String(describing: response.result[0].team_logo))")
            print("in view model \(String(describing: response.result[0].team_name))")
        }
    }
    
    
}
