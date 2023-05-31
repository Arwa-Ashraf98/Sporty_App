//
//  NetworkReachability.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 21/05/2023.
//

import Foundation
import Reachability

class MyNetworkReachability {
    static let networkRechabilityInstance = MyNetworkReachability()
    let reachability = try! Reachability()

    func checkNetwork() -> Bool{
        if reachability.connection != .unavailable {
            return true
        }else {
            return false
        }
    }
}
