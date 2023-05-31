//
//  TeamDetailsViewController.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 23/05/2023.
//

import UIKit
import Kingfisher

class TeamDetailsViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
  
    var sposrtsName : String = ""
    var teamId : Int?
    var teamDetails : TeamResult?
    var playerList : [Player]?
    var teamDetailsViewModel : TeamDetailsViewModel?
    @IBOutlet weak var playerTableView: UITableView!
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        register cell
        playerTableView.register(UINib(nibName: "LeagueTableViewCell", bundle: nil), forCellReuseIdentifier: "teamDetailsCell")
        
        teamDetailsViewModel = TeamDetailsViewModel(networkManager: TeamDetailsNetworkService.instance)
        playerTableView.delegate = self
        playerTableView.dataSource = self
        
        teamDetailsViewModel?.getTeamDetailsData(teamId: teamId!, sportsName: sposrtsName)
        
        teamDetailsViewModel?.getTeamDetailsData(teamId: teamId!, sportsName: sposrtsName)
        
        teamDetailsViewModel?.bindTeamDataResultToViewController = {[weak self] in
            self?.teamDetails = self?.teamDetailsViewModel?.teamDetailsResult[0]
            self?.playerList = self?.teamDetailsViewModel?.teamDetailsResult[0].players
            self?.playerTableView.reloadData()
            self?.teamName.text = self?.teamDetails?.team_name
            KF.url(URL(string: self?.teamDetails?.team_logo ?? "https://apiv2.allsportsapi.com/logo/logo_leagues/3_uefa_champions_league.png"))
                .placeholder(UIImage(named: "player.png"))
                .set(to: (self?.teamImage)!)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerList?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playerTableView.dequeueReusableCell(withIdentifier: "teamDetailsCell") as! LeagueTableViewCell
        
        cell.teamLeagueName.text = playerList?[indexPath.row].player_name ?? "not found"
        KF.url(URL(string: playerList?[indexPath.row].player_image ?? "https://apiv2.allsportsapi.com/logo/logo_leagues/3_uefa_champions_league.png"))
            .placeholder(UIImage(named: "player.png"))
            .set(to: cell.teamLeagueImage!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}
