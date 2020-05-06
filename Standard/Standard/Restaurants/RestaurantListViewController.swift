//
//  RestaurantListViewController.swift
//  Standard
//
//  Created by makoto tajitsu on 2020/05/05.
//  Copyright © 2020 freedom-man.com. All rights reserved.
//

import UIKit

class RestaurantListViewController: UIViewController, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    var selectedRestaurant:RestaurantItem?
    var selectedCity:LocationItem?
    var selectedType:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let location = selectedCity?.city, let type = selectedType
            else { return }
        print("type \(type)")
        print(RestaurantAPIManager.loadJSON(file: location))
    }
}

private extension RestaurantListViewController {
    
}

extension RestaurantListViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier:
        "restaurantCell", for: indexPath)
    }
}
