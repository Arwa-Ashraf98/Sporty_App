//
//  LeaguesUITViewController.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 21/05/2023.
//

import UIKit
import Kingfisher

class LeaguesUITViewController: UITableViewController {

    var sportsName : String = ""
    var footballLeaguesList : [FootballResult]?
    var tennisLeaguList : [TennisesResult]?
    var basketballLeaguesList : [BascketballResult]?
    var cricketLeaguList : [CricketResult]?
    var leagueViewModel : LeaguesViewModel!
    var indicator : UIActivityIndicatorView?
    var networkChecker : MyNetworkReachability?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        register cell
        tableView.register(UINib(nibName: "LeagueTableViewCell", bundle: nil), forCellReuseIdentifier: "leagueCell")
        
        networkChecker = MyNetworkReachability.networkRechabilityInstance
        indicator = UIActivityIndicatorView(style: .large )
        leagueViewModel = LeaguesViewModel(leagueNetowrkService: LeaguesNetworkService.networlInstance)
        
        self.view.addSubview(indicator!)
        indicator!.center = self.view.center
        indicator?.startAnimating()
    
        switch sportsName {
        case "Football" :
            leagueViewModel.getFootballLeagues()
            leagueViewModel.bindFootballResultToViewController = {[weak self] in
                self?.footballLeaguesList = (self?.leagueViewModel?.footBallLaeguesResult)!
                DispatchQueue.main.async { [self] in
                    self?.indicator?.stopAnimating()
                    self?.tableView.reloadData()
                }
            }
            break
            
        case "Tennis" :
            leagueViewModel.getTennisLeagues()
            leagueViewModel.bindTennisResultToViewController = {[weak self] in
                self?.tennisLeaguList = (self?.leagueViewModel?.tennisLaeguesResult)!
                DispatchQueue.main.async { [self] in
                    self?.indicator?.stopAnimating()
                    self?.tableView.reloadData()
                }
            }
            break
            
        case "Basketball" :
            leagueViewModel.getBasketBallLeagues()
            leagueViewModel.bindBasketballResultToViewController = {[weak self] in
                self?.basketballLeaguesList = (self?.leagueViewModel?.basketBallLaeguesResult)!
                DispatchQueue.main.async { [self] in
                    self?.indicator?.stopAnimating()
                    self?.tableView.reloadData()
                }
            }
            break
            
        case "Cricket" :
            leagueViewModel.getCricketLeagues()
            leagueViewModel.bindCricketResultToViewController = {[weak self] in
                self?.cricketLeaguList = (self?.leagueViewModel?.cricketLaeguesResult)!
                DispatchQueue.main.async { [self] in
                    self?.indicator?.stopAnimating()
                    self?.tableView.reloadData()
                }
            }
            break
            
        default :
            print("in default")
            self.indicator?.stopAnimating()
            break
        }
        
    }
    


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch sportsName.lowercased() {
        case "football" :
            return footballLeaguesList?.count ?? 0
            
        case "tennis" :
            return tennisLeaguList?.count ?? 0
            
        case "basketball":
            return basketballLeaguesList?.count ?? 0
            
        case "cricket":
            return cricketLeaguList?.count ?? 0
            
        default :
            return 0
        }
       
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell", for: indexPath) as! LeagueTableViewCell      
        switch sportsName.lowercased() {
        case "football" :
            cell.teamLeagueName?.text = footballLeaguesList?[indexPath.row].leagueName
            KF.url(URL(string: footballLeaguesList?[indexPath.row].leagueLogo ?? "https://apiv2.allsportsapi.com/logo/logo_leagues/3_uefa_champions_league.png"))
                .placeholder(UIImage(named: "placeholder_football"))
                .set(to: cell.teamLeagueImage!)
            break
            
        case "tennis" :
            cell.teamLeagueName?.text = tennisLeaguList?[indexPath.row].leagueName
            cell.teamLeagueImage?.image = UIImage(named: "placeholder_tennis")
            break
            
        case "basketball" :
            cell.teamLeagueName?.text = basketballLeaguesList?[indexPath.row].leagueName
            cell.teamLeagueImage?.image = UIImage(named: "placeholder_basketball")
            break
            
        case "cricket" :
            cell.teamLeagueName?.text = cricketLeaguList?[indexPath.row].leagueName
            cell.teamLeagueImage?.image = UIImage(named: "placeholder_cricket")
            break
            
        default :
            cell.teamLeagueName?.text = " "
            cell.teamLeagueImage?.image = nil
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if networkChecker?.checkNetwork() == true {
            switch sportsName.lowercased() {
            case "football":
                navigateNextScreen(teamId: footballLeaguesList![indexPath.row].leagueKey, sportsName: "football" , logo: footballLeaguesList![indexPath.row].leagueLogo ?? "" , leagueName: footballLeaguesList![indexPath.row].leagueName)
                break
            case "tennis":
                navigateNextScreen(teamId: tennisLeaguList![indexPath.row].leagueKey, sportsName: "tennis" , logo: ""  , leagueName: tennisLeaguList![indexPath.row].leagueName)
                break
            case "basketball" :
                navigateNextScreen(teamId: basketballLeaguesList![indexPath.row].leagueKey, sportsName: "basketball",logo: ""  , leagueName: basketballLeaguesList![indexPath.row].leagueName)
                break
            case "cricket" :
                navigateNextScreen(teamId: cricketLeaguList![indexPath.row].leagueKey, sportsName: "cricket",logo: "" ,leagueName: cricketLeaguList![indexPath.row].leagueName)
                break
                
            default :
                return
            }
        }else {
            showNetworkAlert()
        }
    }
   
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func showNetworkAlert() {
        let alert = UIAlertController(title: "No Internet Connection", message: "Please check your internet connection and try again.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
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
