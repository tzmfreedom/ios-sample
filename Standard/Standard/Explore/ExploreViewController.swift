//
//  ExploreViewController.swift
//  Standard
//
//  Created by makoto tajitsu on 2020/05/05.
//  Copyright © 2020 freedom-man.com. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController, UICollectionViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    let manager = ExploreDataManager()
    var selectedCity:LocationItem?
    var headerView:ExploreHeaderView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
            case Segue.locationList.rawValue:
                showLocationList(segue: segue)
            case Segue.restaurantList.rawValue:
                showRestaurantListing(segue: segue)
            default:
            print("Segue not added")
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String,
         sender: Any?) -> Bool {
        if identifier == Segue.restaurantList.rawValue {
            guard selectedCity != nil else {
                showAlert()
                return false
            }
            return true
        }
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

// MARK: Private Extension
private extension ExploreViewController {
    func initialize() {
        manager.fetch()
    }

    func showAlert() {
        let alertController = UIAlertController(title: "Location Needed",
           message: "Please select a location.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func unwindLocationCancel(segue:UIStoryboardSegue){
    }
    
    @IBAction func unwindLocationDone(segue:UIStoryboardSegue){
        if let viewController = segue.source as? LocationViewController {
            selectedCity = viewController.selectedCity
            if let location = selectedCity {
                headerView.lblLocation.text = location.full
            }
        }
    }
    
    func showLocationList(segue:UIStoryboardSegue){
        guard let navController = segue.destination as? UINavigationController,
          let viewController = navController.topViewController as?
                               LocationViewController else {
            return
        }
        guard let city = selectedCity else { return }
        viewController.selectedCity = city
    }
    
    func showRestaurantListing(segue:UIStoryboardSegue) {
        if let viewController = segue.destination as? RestaurantListViewController,
             let city = selectedCity, let index = collectionView.indexPathsForSelectedItems?.first {
            viewController.selectedType = manager.explore(at: index).name
            viewController.selectedCity = city
        }
    }
}
// MARK: UICollectionViewDataSource
extension ExploreViewController: UICollectionViewDataSource {
     // code goes here
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: "header",
            for: indexPath
        )
        headerView = header as? ExploreHeaderView
        return headerView
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return manager.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
            "exploreCell", for: indexPath) as! ExploreCell
        let item = manager.explore(at: indexPath)
        cell.lblname.text = item.name
        cell.imgExplore.image = UIImage(named: item.image)
        return cell
    }
}
