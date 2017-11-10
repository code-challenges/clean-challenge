//
//  GenioAPIResponse+Parser.swift
//  ExternalInterfaces
//
//  Created by Julio Cesar Guzman Villanueva on 11/10/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import Foundation

extension GenioAPIResponse {
    private struct Keys {
        static let items = "array"
    }
    
    init?(JSON: AnyObject) {
        guard let response = JSON[Keys.items] as? [[String: Any]] else {
            return nil
        }
        self.items = response.flatMap({ (json) -> GenioAPIResponseItem? in
            return GenioAPIResponseItem(JSON: json as AnyObject)
        })
    }
}
