//
//  File.swift
//  ExternalInterfaces
//
//  Created by Julio Cesar Guzman Villanueva on 11/8/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import Foundation

struct Item {
    let type: String
    let text: String
    let imageURL: String?
    let name: String?
}

extension Item {
    private struct Keys {
        static let type = "type"
        static let name = "name"
        static let text = "text"
        static let imageURL = "image"
    }
    
    init?(JSON: AnyObject) {
        guard let type = JSON[Keys.type] as? String,
              let text = JSON[Keys.text] as? String else {
            return nil
        }
        
        self.type = type
        self.name = JSON[Keys.name] as? String
        self.text = text
        self.imageURL = JSON[Keys.imageURL] as? String
    }
}

struct GenioAPIResponse {
    let items: [Item]
}

extension GenioAPIResponse {
    private struct Keys {
        static let items = "array"
    }
    
    init?(JSON: AnyObject) {
        guard let response = JSON[Keys.items] as? [[String: Any]] else {
                return nil
        }
        self.items = response.flatMap({ (json) -> Item? in
            return Item(JSON: json as AnyObject)
        })
    }
}

