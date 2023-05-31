//
//  TestFootBallResponses.swift
//  TestFootBallResponses
//
//  Created by JETS Mobile Lab8 on 30/05/2023.
//

import XCTest
@testable import SportsApp
final class TestGetTeamsNewtorkServices: XCTestCase {

    var teamDetailsNetworkManager : TeamDetailsNetworkService?
    override func setUpWithError() throws {
        teamDetailsNetworkManager = TeamDetailsNetworkService.instance
    }

    override func tearDownWithError() throws {
        teamDetailsNetworkManager = nil
    }
    
    func testGetFootBallTeamDetailsData(){
        let myException = expectation(description: "waiting for api result")
        teamDetailsNetworkManager?.getTeamDetailsData(forTeamID: 153, forSport: "football", completion: { response , error in
            XCTAssert(response != nil)
            myException.fulfill()
        })
        waitForExpectations(timeout: 15)
    }
    
    func testGetFootballPlayers(){
        let myException = expectation(description: "waiting for api result")
        teamDetailsNetworkManager?.getTeamDetailsData(forTeamID: 153, forSport: "football", completion: { response , error in
          
            XCTAssert((response?.result.first?.players!.count)! > 0)
            myException.fulfill()
        })
        waitForExpectations(timeout: 15)
    }
    
    func testGetfootballCoaches(){
        let myException = expectation(description: "waiting for api result")
        teamDetailsNetworkManager?.getTeamDetailsData(forTeamID: 153, forSport: "football", completion: { response , error in
          
            XCTAssert((response?.result.first?.coaches!.count)! > 0)
            myException.fulfill()
        })
        waitForExpectations(timeout: 15)
    }
    
    func testGetCricketTeamDetailsData(){
            let myException = expectation(description: "waiting for api result")
            teamDetailsNetworkManager?.getTeamDetailsData(forTeamID: 79, forSport: "cricket", completion: { response , error in
                XCTAssert(response != nil)
                myException.fulfill()
            })
            waitForExpectations(timeout: 15)
        }
    
    
    func testGetCricketPlayer_Nil_Nothing() {
        let myExcpectation = expectation(description: "wait for api")
        
        teamDetailsNetworkManager?.getTeamDetailsData(forTeamID: 79, forSport: "cricket", completion: {response , error in
            XCTAssertNil(response?.result.first?.players)
            myExcpectation.fulfill()
        })
        waitForExpectations(timeout: 15)
    }
    
    func testGitBasketBallResponse(){
        let meExcpectation = expectation(description: "wait for api")
        
        teamDetailsNetworkManager?.getTeamDetailsData(forTeamID: 79, forSport: "basketball", completion: { response , error in
            XCTAssertNotNil(response?.result)
            meExcpectation.fulfill()
        })
        
        waitForExpectations(timeout: 15)
    }
    
    
    
    
}

