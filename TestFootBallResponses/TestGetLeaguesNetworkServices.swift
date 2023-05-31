//
//  TestGetLeaguesNetworkServices.swift
//  TestFootBallResponses
//
//  Created by Arwa on 31/05/2023.
//

import XCTest
@testable import SportsApp
final class TestGetLeaguesNetworkServices: XCTestCase {

    var leagueNetworkService : LeaguesNetworkService?
    override func setUpWithError() throws {
        leagueNetworkService = LeaguesNetworkService.networlInstance
    }

    override func tearDownWithError() throws {
        leagueNetworkService = nil
    }

    func testGetFootballLeagues(){
        let meExpectation = expectation(description: "api time run out")
        leagueNetworkService?.getFootBallData(handler: { footballResponse in
            XCTAssertNotNil(footballResponse)
            XCTAssert(footballResponse!.result.count > 0)
            meExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 15)
        
    }
    
    func testGetTennisLeagues(){
        let meExpectation = expectation(description: "api time run out")
        leagueNetworkService?.getTennisData(handler: { tennisResponse in
            XCTAssertNotNil(tennisResponse.result)
            XCTAssert(tennisResponse.result.count > 0)
            meExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 15)
        
    }
    
    func testGetCricketLeagues(){
        let meExpectation = expectation(description: "api time run out")
        leagueNetworkService?.getCricketData(handler: { cricketResponse in
            XCTAssertNotNil(cricketResponse)
            meExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 15)
        
        
    }
    
    
    func testGetBasketballLeagues(){
        let meExpectation = expectation(description: "api time run out")
        leagueNetworkService?.getBasketBallData(handler: { basketBall in
            XCTAssertNotNil(basketBall.result)
            XCTAssert((basketBall.result.count) > 0)
            meExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 15)
     
    }

}
