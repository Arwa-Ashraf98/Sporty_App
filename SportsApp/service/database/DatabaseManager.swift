//
//  DatabaseManager.swift
//  SportsApp
//
//  Created by Arwa on 20/05/2023.
//

import Foundation
import CoreData
import UIKit

class DatabaseManager{
    
    let entityName = "Entity"
    
    static let databaseInstance=DatabaseManager()
    var context: NSManagedObjectContext!
    var empObj:[NSManagedObject]!
    var allEmpObj:[NSManagedObject]!
    
    private init(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    func insertData(item:FavoriteTeam!) throws {
        if(item == nil){
            return
        }
            let entity=NSEntityDescription.entity(forEntityName: entityName, in: context!)
            let emp=NSManagedObject(entity: entity!, insertInto: context)
            emp.setValue(item.key , forKey: "id")
            emp.setValue(item.name, forKey: "name")
            emp.setValue(item.sport, forKey: "sport")
            emp.setValue(item.logo, forKey: "logo")
            
            do{
                try context?.save()
            }
            catch let error as NSError{
                print(error.localizedDescription)
            }
    }
    
    func fetchData() throws ->Array<FavoriteTeam>! {
        var arr:Array<FavoriteTeam>!=[]
        let fetchReq=NSFetchRequest<NSManagedObject>(entityName: entityName)
        do{
            empObj = try context?.fetch(fetchReq)
            for emp in empObj!{
                arr.append(FavoriteTeam(
                    key: emp.value(forKey: "id") as? Int ?? 0,
                    name: emp.value(forKey: "name") as? String ?? "unKown",
                    logo: emp.value(forKey: "logo") as? String ?? "placeholder_football",
                    sport: emp.value(forKey: "sport") as? String ?? "football"))
            }
        }
        
        catch let error as NSError{
            print(error.localizedDescription)
        }
        
        if arr.count == 0 {
            print("No Data")
        }
        return arr;
    }
    
    
    func isExistItem(item:FavoriteTeam) throws ->Bool{
        var status:Bool = false
        let data  = try fetchData() ?? []
        for fav in data {
            status = fav.key == item.key
            if status == true{
                break
            }
              
        }
        return status
    }
    
    
    
    func deleteData(item: FavoriteTeam) throws {
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: entityName)
        let predicate = NSPredicate(format: "name == %@", item.name)
        fetchReq.predicate = predicate
        
        do {
            let empObj = try context?.fetch(fetchReq)
            if let object = empObj?.first {
                context?.delete(object)
                try context?.save()
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}


