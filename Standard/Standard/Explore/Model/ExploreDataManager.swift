//
//  ExploreDataManager.swift
//  Standard
//
//  Created by makoto tajitsu on 2020/05/06.
//  Copyright © 2020 freedom-man.com. All rights reserved.
//

import Foundation

class ExploreDataManager : DataManager {
    fileprivate var items:[ExploreItem] = []
    
    func numberOfItems() -> Int {
        return items.count
    }

    func explore(at index:IndexPath) -> ExploreItem {
        return items[index.item]
    }
    
    func fetch() {
        for data in load(file: "ExploreData") {
            items.append(ExploreItem(dict: data))
        }
    }
}
