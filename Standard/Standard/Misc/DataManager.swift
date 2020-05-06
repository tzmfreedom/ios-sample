//
//  DataManager.swift
//  Standard
//
//  Created by makoto tajitsu on 2020/05/06.
//  Copyright © 2020 freedom-man.com. All rights reserved.
//

import Foundation

protocol DataManager {
    func load(file name:String) -> [[String:AnyObject]]
}

extension DataManager {
    func load(file name:String) -> [[String:AnyObject]] {
        guard let path = Bundle.main.path(forResource:
           name, ofType: "plist"),
            let items = NSArray(contentsOfFile: path)
     
    else {
            return [[:]]
          }
        return items as! [[String:AnyObject]]
    }
}
