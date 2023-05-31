//
//  ViewController.swift
//  SportsApp
//
//  Created by Arwa on 19/05/2023.
//

import UIKit
import Alamofire

class HomeViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var myCollectionView: UICollectionView!
    var networkChecker : MyNetworkReachability?
    let sportslist: [Sports] = [
        Sports(sportsName: "Football", sportImage: UIImage(named: "placeholder_football")!),
        Sports(sportsName: "Tennis", sportImage: UIImage(named: "placeholder_tennis")!),
        Sports(sportsName: "Cricket", sportImage: UIImage(named: "placeholder_cricket")!),
        Sports(sportsName: "Basketball", sportImage: UIImage(named: "placeholder_basketball")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkChecker = MyNetworkReachability.networkRechabilityInstance
//        myCollectionView.dataSource = self
//        myCollectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellWidth = (myCollectionView.frame.width - 10) / 2
//        let cellHeight = cellWidth * 1.5
        
        return CGSize(width: myCollectionView.frame.width / 2, height: 220)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportslist.count
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
    
        cell.sportsNameLabel.text = sportslist[indexPath.row].sportsName
        cell.sportsImage.image = sportslist[indexPath.row].sportImage
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if networkChecker!.checkNetwork() == true {
            let title = sportslist[indexPath.row].sportsName
            print(title!)
            let leagueViewController = self.storyboard?.instantiateViewController(withIdentifier: "leagues") as! LeaguesUITViewController
            leagueViewController.sportsName = title!
            self.navigationController?.pushViewController(leagueViewController, animated: true)
            return
        }else {
            showNetworkAlert()
        }
        
    }
    
    func showNetworkAlert() {
        let alert = UIAlertController(title: "No Internet Connection", message: "Please check your internet connection and try again.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

}

