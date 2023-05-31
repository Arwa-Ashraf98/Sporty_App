//
//  TestGetLatestEventResponse.swift
//  TestFootBallResponses
//
//  Created by Arwa on 31/05/2023.
//

import XCTest
@testable import SportsApp
final class TestGetLatestEventResponse: XCTestCase {
    
    var leagueDatailsNetworkService : LeagueDetailsNetworkService?
    var today : Date?
    var nextYearDate : Date?
    var prevYear : Date?
    override func setUpWithError() throws {
        today = Date()
        nextYearDate = Calendar.current.date(byAdding: .year, value: 1, to: today!)!
        prevYear = Calendar.current.date(byAdding: .year, value: -1, to: today!)!
        leagueDatailsNetworkService = LeagueDetailsNetworkService.instance
    }

    override func tearDownWithError() throws {
       leagueDatailsNetworkService = nil
        today = nil
        prevYear = nil
        nextYearDate = nil
    }

    func testGetUpCommingEventForFootball(){
        let myExpectation = expectation(description: "api time run out")
        leagueDatailsNetworkService?.getFixtureData(forLeagueID: 5, forSport: "football", fromDate: today!, toDate: nextYearDate!, completion: { footballresopnse , error in
            XCTAssertNotNil(footballresopnse)
            myExpectation.fulfill()
            
        })
        
        waitForExpectations(timeout: 20)
    }
    
    func testGetUpCommingEventForBasketBall(){
        let myExpectation = expectation(description: "api time run out")
        leagueDatailsNetworkService?.getFixtureData(forLeagueID: 700, forSport: "basketball", fromDate: today!, toDate: nextYearDate!, completion: { basketResponse , error in
            XCTAssertNil(basketResponse)
            XCTAssertNotNil(error)
            myExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 20)
    }
    
    func testGetUpCommingEventForCricket(){
        let myExpectation = expectation(description: "api time run out")
        leagueDatailsNetworkService?.getFixtureData(forLeagueID: 78, forSport: "cricket", fromDate: today!, toDate: nextYearDate!, completion: { cricketResponse , error in
            XCTAssertNil(cricketResponse)
            XCTAssert((error != nil))
            myExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 20)
    }
    
    func testGetUpCommingEventForTennis(){
        let myExpectation = expectation(description: "api time run out")
        leagueDatailsNetworkService?.getFixtureData(forLeagueID: 78, forSport: "tennis", fromDate: today!, toDate: nextYearDate!, completion: { tennisResponse , error in
            XCTAssertNil(tennisResponse)
            XCTAssertNotNil(error)
            myExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 20)
    }
    
    func testGetLatestEventForFootball(){
        let myExpectation = expectation(description: "api time run out")
        leagueDatailsNetworkService?.getLatestEventData(forLeagueID: 105, forSport: "football", fromDate: prevYear!, toDate: today!, completion: { response , error in
            XCTAssertNotNil(response?.result)
            myExpectation.fulfill()
            
        })
        waitForExpectations(timeout: 20)
    }
    
    func testGetLatestEventForBasketBall(){
        let myExpectation = expectation(description: "api time run out")
        leagueDatailsNetworkService?.getLatestEventData(forLeagueID: 700, forSport: "basketball", fromDate: prevYear!, toDate: today!, completion: { response , error in
            XCTAssertNil(response)
            myExpectation.fulfill()
            
        })
        waitForExpectations(timeout: 20)
    }
    
    func testGetLatestEventForCricket(){
        let myExpectation = expectation(description: "api time run out")
        leagueDatailsNetworkService?.getLatestEventData(forLeagueID: 78, forSport: "cricket", fromDate: prevYear!, toDate: today!, completion: { response , error in
            XCTAssertNil(response?.result)
            myExpectation.fulfill()
            
        })
        waitForExpectations(timeout: 20)
    }
    
    func testGetLatestEventForTennis(){
        let myExpectation = expectation(description: "api time run out")
        leagueDatailsNetworkService?.getLatestEventData(forLeagueID: 100, forSport: "tennis", fromDate: prevYear!, toDate: today!, completion: { response , error in
            XCTAssertNil(response)
            myExpectation.fulfill()
            
        })
        waitForExpectations(timeout: 20)
    }
}
