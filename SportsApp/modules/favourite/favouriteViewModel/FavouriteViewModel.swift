//
//  FavouriteViewModel.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 30/05/2023.
//

import Foundation


class FvaouriteViewModel {
    var database : DatabaseManager
    var bindFavListtoViewController : (([FavoriteTeam]) -> ()) = { favouriteList in
        
    }
    
    init(databaseManager: DatabaseManager) {
        self.database = databaseManager
    }
    
    
    
    
    func getAllFavouriteTeams() {
        let list = try? database.fetchData()
        bindFavListtoViewController(list ?? [])
    }
    
    func deleteRemoveItem(item : FavoriteTeam){
        try? database.deleteData(item: item)
    }
    
    
    
}
