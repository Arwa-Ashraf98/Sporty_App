//
//  TeamDetailsViewController.swift
//  SportsApp
//
//  Created by JETS Mobile Lab8 on 24/05/2023.
//

import UIKit
import Reachability
import Kingfisher
import Alamofire

class LeaugeDetailsViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    @IBOutlet weak var favButton: UIBarButtonItem!
    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    @IBOutlet weak var thirdCollectionView: UICollectionView!
    
    var sportsName : String = ""
    var teamId : Int?
    var leaguelogo : String = ""
    var leagueName :String  = ""
    var fixtureResultList : [UpCommingEventResult]?
    var latestEventResultList : [UpCommingEventResult]?
    var teamList : [LeagueTeams]?
    var leagueDetailsViewModel : LeagueDetailsViewModel!
    var indicator : UIActivityIndicatorView?
  //  var layOut : UICollectionViewCompositionalLayout?
    var databaseManager : DatabaseManager?
    var favItem : FavoriteTeam?
    var isExist : Bool?

    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  setupCollectionViewLayout()
        
        isExist = false
        databaseManager = DatabaseManager.databaseInstance
        favItem = FavoriteTeam(key: teamId!, name: leagueName, logo: leaguelogo, sport: sportsName)
        leagueDetailsViewModel = LeagueDetailsViewModel(leagueNetowrkService: LeagueDetailsNetworkService.instance , database:  databaseManager!)
        
        indicator = UIActivityIndicatorView(style: .large )
        self.view.addSubview(indicator!)
        indicator!.center = self.view.center
        indicator?.startAnimating()
        
        
//        layOut = UICollectionViewCompositionalLayout { sectionIndex , environment in
//            switch sectionIndex {
//            case 0:
//                return self.drawFirstSectionLayout()
//            case 1 :
//                return self.drawSecondSectionLayout()
//            default :
//                return self.drawThirdSectionLayout()
//            }
//        }
        
   //     myCollectionView.setCollectionViewLayout(layOut!, animated: true)
        leagueDetailsViewModel.getFuxtureData(leagueId: teamId!, sportsName:sportsName)
        
       
        leagueDetailsViewModel.bindFixtureDataResultToViewController = {[weak self] in
            self?.fixtureResultList = (self?.leagueDetailsViewModel.fixtureLaeguesResult)
            DispatchQueue.main.async { [self] in
                self?.leagueDetailsViewModel.getLatestEventData(leagueId: (self?.teamId!)!, sportsName: self!.sportsName)
                self?.loadCollections()
            }
        }
        
        leagueDetailsViewModel.bindLatestEventResultToViewController = {[weak self] in
            self?.latestEventResultList = (self?.leagueDetailsViewModel.latestEventResult)
            self?.leagueDetailsViewModel.getTeams()
            DispatchQueue.main.async { [self] in
                self?.indicator?.stopAnimating()
                self?.loadCollections()
            }
        }
        
        leagueDetailsViewModel.bindTeamsToViewController = {[weak self] in
            self?.teamList = self?.leagueDetailsViewModel.teamsResult
        }
    }
    
    func loadCollections() {
        firstCollectionView.reloadData()
        secondCollectionView.reloadData()
        thirdCollectionView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
            let result = leagueDetailsViewModel.chechIfIsExist(item: favItem!)
            if (result == true){
            favButton.image = UIImage(systemName: "star.fill")
               isExist = true
                   }else {
                       favButton.image = UIImage(systemName: "star")
                       isExist = false
                   }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let height = collectionView.frame.height > 200 ? 200 : collectionView.frame.height
        if collectionView.tag == 2 {
            return CGSize(width: 150, height: height)
        }
       
        return CGSize(width: collectionView.frame.width, height: height)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if leagueDetailsViewModel.flag == false && leagueDetailsViewModel.falg2 == false{
            showAlert()
        }
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Failed", message: "There is no Upcomming Events nither Latest Event Please come later", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            self.dismiss(animated: true)
        }
      
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

 

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
      
        switch collectionView.tag {
        case 0 :
            return fixtureResultList?.count ?? 1
        case 1 :
            return latestEventResultList?.count ?? 1
        default :
            return teamList?.count ?? 1
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0 :
//            print("Section => 00")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upCommingCell", for: indexPath) as! UpComingEventsCollectionViewCell
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1.0
            cell.layer.cornerRadius = 16.0
            cell.layer.masksToBounds = false
            if fixtureResultList != nil{
            
                KF.url(URL(string: fixtureResultList?[indexPath.row].away_team_logo ?? "https://apiv2.allsportsapi.com/logo/logo_leagues/3_uefa_champions_league.png"))
                    .placeholder(UIImage(named: "sports.png"))
                    .set(to: cell.secondTeamImage!)
                
                KF.url(URL(string: fixtureResultList?[indexPath.row].home_team_logo ?? "https://apiv2.allsportsapi.com/logo/logo_leagues/3_uefa_champions_league.png"))
                    .placeholder(UIImage(named: "sports.png"))
                    .set(to: cell.firstTeamImage!)
                
                cell.firstTeamName.text = fixtureResultList![indexPath.row].event_home_team
                
                cell.secondTeamName.text = fixtureResultList![indexPath.row].event_away_team
                
                cell.dateLabel.text = fixtureResultList![indexPath.row].event_date
                
            }else {
                KF.url(URL(string: fixtureResultList?[indexPath.row].away_team_logo ?? "https://apiv2.allsportsapi.com/logo/logo_leagues/3_uefa_champions_league.png"))
                    .placeholder(UIImage(named: "sports.png"))
                    .set(to: cell.secondTeamImage!)
                
                KF.url(URL(string: fixtureResultList?[indexPath.row].home_team_logo ?? "https://apiv2.allsportsapi.com/logo/logo_leagues/3_uefa_champions_league.png"))
                    .placeholder(UIImage(named: "sports.png"))
                    .set(to: cell.firstTeamImage!)
                
                cell.firstTeamName.text = "No Up comming Events"
                
                cell.secondTeamName.text = "No Up comming Events"
                
                cell.dateLabel.text = "No Up comming Events"
            }
            return cell
            
        case 1 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestCell", for: indexPath) as! LatestEventCollectionViewCell
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1.0
            cell.layer.cornerRadius = 16.0
            cell.layer.masksToBounds = false
            if latestEventResultList != nil {
                KF.url(URL(string: latestEventResultList?[indexPath.row].away_team_logo ?? "https://apiv2.allsportsapi.com/logo/logo_leagues/3_uefa_champions_league.png"))
                    .placeholder(UIImage(named: "sports.png"))
                    .set(to: cell.secondTeamImage!)
                
                KF.url(URL(string: latestEventResultList?[indexPath.row].home_team_logo ?? "https://apiv2.allsportsapi.com/logo/logo_leagues/3_uefa_champions_league.png"))
                    .placeholder(UIImage(named: "sports.png"))
                    .set(to: cell.firstTeamImage!)
                
                cell.firstTeamName.text = latestEventResultList![indexPath.row].event_home_team
                
                cell.secondTeamName.text = latestEventResultList![indexPath.row].event_away_team
                cell.myDateLabel.text = latestEventResultList![indexPath.row].event_date
        
                let score1 = latestEventResultList![indexPath.row].event_final_result?.split(separator: " - ").first
                let score2 = latestEventResultList![indexPath.row].event_final_result?.split(separator: " - ").last
                cell.firstTeamScore.text = "\(String(describing: score1!))"
                cell.secondTeamScore.text = "\(String(describing: score2!))"
            }else {
                KF.url(URL(string: latestEventResultList?[indexPath.row].away_team_logo ?? "https://apiv2.allsportsapi.com/logo/logo_leagues/3_uefa_champions_league.png"))
                    .placeholder(UIImage(named: "sports.png"))
                    .set(to: cell.secondTeamImage!)
                
                KF.url(URL(string: latestEventResultList?[indexPath.row].home_team_logo ?? "https://apiv2.allsportsapi.com/logo/logo_leagues/3_uefa_champions_league.png"))
                    .placeholder(UIImage(named: "sports.png"))
                    .set(to: cell.firstTeamImage!)
                
                cell.firstTeamName.text = "no latest event"
                
                cell.secondTeamName.text = "no latest event"
                
                cell.firstTeamScore.text = "no score"
                cell.secondTeamScore.text = "no score"
                
                cell.myDateLabel.text = "no latest event"
            }
           
            return cell
            
        default :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamsCollectionViewCell
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1.0
            cell.layer.cornerRadius = 16.0
            cell.layer.masksToBounds = false
            if teamList != nil {
                KF.url(URL(string: teamList?[indexPath.row].image ?? "https://apiv2.allsportsapi.com/logo/logo_leagues/3_uefa_champions_league.png"))
                    .placeholder(UIImage(named: "sports.png"))
                    .set(to: cell.teamImage!)
            }else {
                KF.url(URL(string: teamList?[indexPath.row].image ?? "https://apiv2.allsportsapi.com/logo/logo_leagues/3_uefa_champions_league.png"))
                    .placeholder(UIImage(named: "sports.png"))
                    .set(to: cell.teamImage!)
            }
            return cell
        
        }
       
       
    }

//    func drawFirstSectionLayout()->NSCollectionLayoutSection{
//            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
//                let item = NSCollectionLayoutItem(layoutSize: itemSize)
//            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(380), heightDimension: .absolute(180))
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5
//                 , bottom: 0, trailing: 10)
//            let section = NSCollectionLayoutSection(group: group)
//            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0)
//            section.orthogonalScrollingBehavior = .paging
//            section.boundarySupplementaryItems = [
//            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30)), elementKind: "upcomingEvents", alignment: .top),
//            ]
//            section.visibleItemsInvalidationHandler = { (items, offset, environment) in
//                 items.forEach { item in
//                     let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
//                     let minScale: CGFloat = 0.9
//                 let maxScale: CGFloat = 1.0
//                 let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
//                 item.transform = CGAffineTransform(scaleX: scale, y: scale)
//                 }
//            }
//            return section
//        }
//
//        func drawSecondSectionLayout()->NSCollectionLayoutSection{
//
//            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
//
//                let item = NSCollectionLayoutItem(layoutSize: itemSize)
//            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(380), heightDimension: .absolute(200))
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5
//                 , bottom: 20, trailing: 10)
//            let section = NSCollectionLayoutSection(group: group)
//            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0)
//            section.orthogonalScrollingBehavior = .none
//            section.boundarySupplementaryItems = [
//            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30)), elementKind: "latestResults", alignment: .top),
//            ]
//
//            return section
//        }
//
//        func drawThirdSectionLayout()->NSCollectionLayoutSection{
//            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
//                   , heightDimension: .fractionalHeight(1))
//           let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//           let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(128)
//           , heightDimension: .absolute(128))
//           let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize
//           , subitems: [item])
//           group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
//           , bottom: 0, trailing: 10)
//
//           let section = NSCollectionLayoutSection(group: group)
//           section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15
//           , bottom: 10, trailing: 15)
//           section.orthogonalScrollingBehavior = .continuous
//                    section.boundarySupplementaryItems = [
//                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30)), elementKind: "teams", alignment: .top),
//                    ]
//            return section
//        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag {
        case 0 :
            return
        case 1 :
            return
        default :
            let teamDeatisVC = self.storyboard?.instantiateViewController(withIdentifier: "teamDetails") as! TeamDetailsViewController
            teamDeatisVC.sposrtsName = self.sportsName
            teamDeatisVC.teamId = teamList![indexPath.row].teamKey
            self.present(teamDeatisVC, animated: true)
        }
    }
    

//    func setupCollectionViewLayout() {
//
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        myCollectionView.collectionViewLayout = layout
//    }
//
    @IBAction func addToFavourite(_ sender: Any) {
        DispatchQueue.main.async { [weak self] in
            if self?.leagueDetailsViewModel.chechIfIsExist(item: (self?.favItem)!) == true {
                self?.showErrorAlert()
                   }else {
                       self?.showConfirmationAlert()
                   }
        }
       
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func showErrorAlert(){
        let alert = UIAlertController(title: "Favourites", message: "This Item is already in favourite", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showConfirmationAlert(){
        let alert = UIAlertController(title: "Favourite", message: "Are you sure to add this League To favourite?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: .default) { [weak self] UIAlertAction in
            self?.leagueDetailsViewModel.insertTeamToFavourite(item: (self?.favItem)!)
            self?.favButton.image = UIImage(systemName: "star.fill")
        }
        
        let noAction = UIAlertAction(title: "No", style: .default){UIAlertAction in
       
        }
        
        alert.addAction(okAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }

}
