//
//  FavouriteViewController.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 21/05/2023.
//

import UIKit
import Kingfisher

class FavouriteViewController: UITableViewController {
    var favList : [FavoriteTeam]?
    var databaseManager : DatabaseManager?
    var favViewModel : FvaouriteViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        databaseManager = DatabaseManager.databaseInstance
        favViewModel = FvaouriteViewModel(databaseManager: databaseManager!)
        let  nib = UINib(nibName: "LeagueTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "favouriteCell")
        
    }

    // MARK: - Table view data source

    func getData(){
        favViewModel?.bindFavListtoViewController = { [weak self] favouriteList in
            self?.favList = favouriteList
            self?.tableView.reloadData()
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
        getData()
        favViewModel?.getAllFavouriteTeams()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favList?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteCell", for: indexPath) as! LeagueTableViewCell
        cell.teamLeagueName.text = favList?[indexPath.row].name
        KF.url(URL(string: favList?[indexPath.row].logo ?? "https://apiv2.allsportsapi.com/logo/logo_leagues/3_uefa_champions_league.png"))
            .placeholder(UIImage(named: "placeholder_football"))
            .set(to: cell.teamLeagueImage!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        navigateNextScreen(teamId: favList![indexPath.row].key, sportsName: favList![indexPath.row].sport , logo: favList![indexPath.row].logo , leagueName: favList![indexPath.row].name)
             
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            showDeleteAlert(item: self.favList![indexPath.row] , index: indexPath.row)
            self.tableView.reloadData()
        }
    }
    
 
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func showDeleteAlert(item : FavoriteTeam , index : Int) {
        let alert = UIAlertController(title: "Delete", message: "Are you sure to Delete this League?", preferredStyle: .alert)
        let noAction = UIAlertAction(title: "No", style: .default) {_ in
            
        }
        let okAction = UIAlertAction(title: "Yes", style: .default) { [weak self] UIAlertAction in
            self?.favList?.remove(at: index)
            self?.favViewModel?.deleteRemoveItem(item: item)
            self?.tableView.reloadData()
        }
        alert.addAction(okAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Favourite"
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       25.0
    }
    
    func navigateNextScreen(teamId : Int , sportsName : String , logo : String , leagueName : String){
        let teamDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "leagueDetails") as! LeaugeDetailsViewController
        teamDetailsViewController.teamId = teamId
        teamDetailsViewController.sportsName = sportsName
        teamDetailsViewController.leaguelogo = logo
        teamDetailsViewController.leagueName = leagueName
        self.present(teamDetailsViewController, animated: true)
    }

}
