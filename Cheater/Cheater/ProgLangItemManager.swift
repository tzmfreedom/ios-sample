//
//  ProgLangItemManager.swift
//  StandardUIKit
//
//  Created by makoto tajitsu on 2020/05/09.
//  Copyright © 2020 freedom-man.com. All rights reserved.
//

import Foundation

class ProgLangItemManager {
    let uri = "https://s3.ap-northeast-1.amazonaws.com/s3.freedom-man.com/api.json"
    var items: [ProgLangItem] = []
    
    func fetch(callback: @escaping () -> Void) {
        guard let url = URLComponents(string: uri) else { return }

        let task = URLSession.shared.dataTask(with: url.url!, completionHandler: { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            guard let _data = data else { return }

            let items = try! JSONDecoder().decode([ProgLangItem].self, from: _data)
            self.items = items
            callback()
        })
        task.resume()
    }
    
    func get(name: String) -> ProgLangItem? {
        return items.first { (item: ProgLangItem) -> Bool in
            item.name == name
        }
    }
}
