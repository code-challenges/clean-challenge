//
//  Item+Parser.swift
//  ExternalInterfaces
//
//  Created by Julio Cesar Guzman Villanueva on 11/10/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import Foundation

extension GenioAPIResponseItem {
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
