//
//  LeagueDetailsNetworkService.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 21/05/2023.
//

import Foundation
import Alamofire

class LeagueDetailsNetworkService : LeagueDetailsNetworkSericeProtocol {
    
    static let instance = LeagueDetailsNetworkService()
//    get fixturedata 
    func getFixtureData (forLeagueID leagueID: Int, forSport sport: String, fromDate: Date, toDate: Date, completion: @escaping (UpComingResponse?, Error?) -> Void) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let fromDateString = dateFormatter.string(from: fromDate)
        let toDateString = dateFormatter.string(from: toDate)
       
        let url = "\(Constants.BASE_URL)\(sport.lowercased())/?met=Fixtures&APIkey=\(Constants.apiKey)&leagueId=\(leagueID)&from=\(fromDateString)&to=\(toDateString)"

        AF.request(url , method: .get , parameters: nil , encoding : URLEncoding.default , headers : nil , interceptor : nil).response {responce in

            switch responce.result {
            case .success(let data):
                do {
                    let jsondata = try JSONDecoder().decode(UpComingResponse.self, from: data!)
                    completion(jsondata, nil)
                }catch {
                    print(error.localizedDescription)
                    completion(nil,error)
                }
            case .failure(let error) :
                completion(nil, error)
                print(error.localizedDescription)
            }
        }
    }
    
    func getLatestEventData (forLeagueID leagueID: Int, forSport sport: String, fromDate: Date, toDate: Date, completion: @escaping (UpComingResponse?, Error?) -> Void) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let fromDateString = dateFormatter.string(from: fromDate)
        let toDateString = dateFormatter.string(from: toDate)
       
        let url = "\(Constants.BASE_URL)\(sport.lowercased())/?met=Fixtures&APIkey=\(Constants.apiKey)&leagueId=\(leagueID)&from=\(fromDateString)&to=\(toDateString)"

        AF.request(url , method: .get , parameters: nil , encoding : URLEncoding.default , headers : nil , interceptor : nil).response {responce in

            switch responce.result {
            case .success(let data):
                do {
                    print("inside succuss 111\n")
                    let jsondata = try JSONDecoder().decode(UpComingResponse.self, from: data!)
                    completion(jsondata, nil)
                }catch {
                    print("inside cach 111\n")
                    print(error.localizedDescription)
                    completion(nil, error)
                }
            case .failure(let error) :
                completion(nil, error)
                print("inide fails 111\n")
                print(error.localizedDescription)
            }
        }
    }
    
    
}
