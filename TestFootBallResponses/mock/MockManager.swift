//
//  MockManager.swift
//  TestFootBallResponses
//
//  Created by JETS Mobile Lab8 on 31/05/2023.
//

import Foundation
import XCTest
@testable import SportsApp
class MockManager : XCTestCase{
    var fakeMock : FakeMock?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        fakeMock = FakeMock(flagShouldReturnError: false)
    }
    
    func testFackMockFootbalLeagueData(){
        fakeMock!.getFootBallData(url: "", compilationHandler: { response , error in
            if error != nil{
                XCTFail()
            }else {
                XCTAssert((response != nil))
            }
        })
    }
    
    func testFackMockBasketBallLeagueData(){
        fakeMock!.getBasketData(url: "", compilationHandler: { response , error in
            if error != nil{
                XCTFail()
            }else {
                XCTAssert((response != nil))
            }
        })
    }
    
    func testFackMockCricketLeagueData() {
        fakeMock!.getCricketData(url: "", compilationHandler: { response , error in
            if error != nil{
                XCTFail()
            }else {
                XCTAssert((response != nil))
            }
        })
    }
    
    func testFackMockTeamDetailsDataForFootball() {
        fakeMock!.getTeamdetailsDataForFootball(url: "", compilationHandler: { response , error in
            if error != nil{
                XCTFail()
            }else {
                XCTAssert((response != nil))
            }
        })
    }
    
    func testFackMockTEventsDataForFootball() {
        fakeMock!.getEventsDataForFootball(url: "", compilationHandler: { response , error in
            if error != nil{
                XCTFail()
            }else {
                XCTAssert((response != nil))
            }
        })
    }

}
