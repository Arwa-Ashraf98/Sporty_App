//
//  FakeMock.swift
//  TestFootBallResponses
//
//  Created by JETS Mobile Lab8 on 31/05/2023.
//

import Foundation
@testable import SportsApp

class FakeMock{
    
    let flagShouldReturnError : Bool
    let myFootballTeamResponse = footballLeaguesResponse
    let basketLeagueResponse = basketLeaguesResponse
    let cricketLeagueResponse = cricketLeaguesResponse
    let eventForFootballResponse = footballEventResponse
    let teamDetailsForFootballResponse = footballTeamResponse
    
    init(flagShouldReturnError: Bool) {
        self.flagShouldReturnError = flagShouldReturnError
    }
    
    enum ResponseWithError : Error{
        case responseError
    }
    
    func getFootBallData(url : String , compilationHandler:@escaping (String?, Error?)->Void){
        if flagShouldReturnError{
            compilationHandler(nil, ResponseWithError.responseError)
        }else {
            compilationHandler(myFootballTeamResponse , nil)
        }
    }
    
    func getBasketData(url : String , compilationHandler:@escaping (String?, Error?)->Void){
        
        if flagShouldReturnError{
            compilationHandler(nil, ResponseWithError.responseError)
        }else {
            compilationHandler(basketLeagueResponse , nil)
        }
        
    }
    
    func getCricketData(url : String , compilationHandler:@escaping (String?, Error?)->Void){
        if flagShouldReturnError{
            compilationHandler(nil, ResponseWithError.responseError)
        }else {
            compilationHandler(cricketLeagueResponse , nil)
        }
    }
    
    
    func getTeamdetailsDataForFootball(url : String , compilationHandler:@escaping (String?, Error?)->Void){
        if flagShouldReturnError{
            compilationHandler(nil, ResponseWithError.responseError)
        }else {
            compilationHandler(teamDetailsForFootballResponse , nil)
        }
    }

    func getEventsDataForFootball(url : String , compilationHandler:@escaping (String?, Error?)->Void){
        if flagShouldReturnError{
            compilationHandler(nil, ResponseWithError.responseError)
        }else {
            compilationHandler(eventForFootballResponse , nil)
        }
    }
    
    
}

//class MockTeamDetailsNetworkService:TeamDetailsNetworkServiceProtocol{
//
//    func getTeamDetailsData(forTeamID teamID: Int, forSport sport: String, completion: @escaping (SportsApp.TeamResponse?, Error?) -> Void) {
//
//        let data = Data(footballLeaguesResponse.utf8)
//        do {
//            let jsondata = try JSONDecoder().decode(TeamResponse.self, from: data)
//            completion(jsondata, nil)
//        }catch {
//            print(error.localizedDescription)
//        }
//    }
//}
//
//
//class MockLeaguesNetworkService:LeagueDetailsNetworkSericeProtocol {
//
//    func getFixtureData(forLeagueID leagueID: Int, forSport sport: String, fromDate: Date, toDate: Date, completion: @escaping (SportsApp.UpComingResponse?, Error?) -> Void) {
//
//        let data = Data(footballEventResponse.utf8)
//        do {
//            let jsondata = try JSONDecoder().decode(UpComingResponse.self, from: data)
//            completion(jsondata, nil)
//        }catch {
//            print(error.localizedDescription)
//        }
//    }
//
//    func getLatestEventData(forLeagueID leagueID: Int, forSport sport: String, fromDate: Date, toDate: Date, completion: @escaping (SportsApp.UpComingResponse?, Error?) -> Void) {
//
//        let data = Data(tennisEventsResponse.utf8)
//        do {
//            let jsondata = try JSONDecoder().decode(UpComingResponse.self, from: data)
//            completion(jsondata, nil)
//        }catch {
//            print(error.localizedDescription)
//        }
//    }
//
//}
//
//
//class MockTestLeaguesNetworkService:LeaguesNetworkServiceProtocol{
//    func getFootBallData(handler: @escaping (SportsApp.FootBallResponse?) -> (Void)) {
//        let data = Data(footballLeaguesResponse.utf8)
//        do {
//            let jsondata = try JSONDecoder().decode(FootBallResponse.self, from: data)
//            handler(jsondata)
//        }catch {
//            print(error.localizedDescription)
//        }
//    }
//
//    func getCricketData(handler: @escaping (SportsApp.CricketResponse) -> (Void)) {
//        let data = Data(cricketLeaguesResponse.utf8)
//        do {
//            let jsondata = try JSONDecoder().decode(CricketResponse.self, from: data)
//            handler(jsondata)
//        }catch {
//            print(error.localizedDescription)
//        }
//    }
//
//    func getBasketBallData(handler: @escaping (SportsApp.BasketResponse) -> (Void)) {
//        let data = Data(basketLeaguesResponse.utf8)
//        do {
//            let jsondata = try JSONDecoder().decode(BasketResponse.self, from: data)
//            handler(jsondata)
//        }catch {
//            print(error.localizedDescription)
//        }
//    }
//
//    func getTennisData(handler: @escaping (SportsApp.TennisResponse) -> (Void)) {
//        let data = Data(tennisLeaguesRsepnse.utf8)
//        do {
//            let jsondata = try JSONDecoder().decode(TennisResponse.self, from: data)
//            handler(jsondata)
//        }catch {
//            print(error.localizedDescription)
//        }
//    }
//}


