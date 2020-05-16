//
//  ProgLangItem.swift
//  StandardUIKit
//
//  Created by makoto tajitsu on 2020/05/09.
//  Copyright © 2020 freedom-man.com. All rights reserved.
//

import Foundation

class ProgLangItem: Codable {
    let name: String
    let codes: [Code]
    
    init(name: String, codes: [Code]) {
        self.name = name
        self.codes = codes
    }
    
    func getCode(name: String) -> String? {
        return codes.first { (code: Code) -> Bool in
            code.name == name
        }?.code
    }
    
    func menuItemSize() -> Int {
        codes.count
    }
    
    func menuItems() -> [String] {
        return codes.map { (code: Code) -> String in
            code.name
        }
    }
}

class Code: Codable {
    let name: String
    let code: String
}
