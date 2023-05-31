//
//  NetworkService.swift
//  SportsApp
//
//  Created by Arwa on 20/05/2023.
//

import Foundation
import Alamofire

class LeaguesNetworkService : LeaguesNetworkServiceProtocol {

    static let networlInstance = LeaguesNetworkService()
    
    func getFootBallData(handler : @escaping(_ apiData:FootBallResponse?) -> (Void)) {
        let url = TeamHelper.SportsLeagues.Football
        AF.request(url , method: .get , parameters: nil , encoding : URLEncoding.default , headers : nil , interceptor : nil).response {responce in
            switch responce.result {
            case .success(let data):
                do {
                    print("inside succuss \n")
                    let jsondata = try JSONDecoder().decode(FootBallResponse.self, from: data!)
                    handler(jsondata)
                }catch {
                    print("inside cach \n")
                    print(error.localizedDescription)
                }
            case .failure(let error) :
                print("inide fails \n")
                print(error.localizedDescription)
            }
        }
    }
    
    
    func getCricketData(handler : @escaping(_ apiData:CricketResponse) -> (Void)) {
        let url = TeamHelper.SportsLeagues.Cricket
        AF.request(url , method: .get , parameters: nil , encoding : URLEncoding.default , headers : nil , interceptor : nil).response {responce in
            switch responce.result {
            case .success(let data):
                do {
                    let jsondata = try JSONDecoder().decode(CricketResponse.self, from: data!)
                    handler(jsondata)
                }catch {
                    print(error.localizedDescription)
                }
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    func getBasketBallData(handler : @escaping(_ apiData:BasketResponse) -> (Void)) {
        let url = TeamHelper.SportsLeagues.Basketball
        AF.request(url , method: .get , parameters: nil , encoding : URLEncoding.default , headers : nil , interceptor : nil).response {responce in
            switch responce.result {
            case .success(let data):
                do {
                    let jsondata = try JSONDecoder().decode(BasketResponse.self, from: data!)
                    handler(jsondata)
                }catch {
                    print(error.localizedDescription)
                }
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    
    func getTennisData(handler : @escaping(_ apiData:TennisResponse) -> (Void)) {
        let url = TeamHelper.SportsLeagues.Tennis
        AF.request(url , method: .get , parameters: nil , encoding : URLEncoding.default , headers : nil , interceptor : nil).response {responce in
            switch responce.result {
            case .success(let data):
                do {
                    let jsondata = try JSONDecoder().decode(TennisResponse.self, from: data!)
                    handler(jsondata)
                }catch {
                    print(error.localizedDescription)
                }
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
}




