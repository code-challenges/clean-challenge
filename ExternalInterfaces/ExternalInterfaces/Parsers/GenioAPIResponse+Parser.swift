//
//  GenioAPIResponse+Parser.swift
//  ExternalInterfaces
//
//  Created by Julio Cesar Guzman Villanueva on 11/10/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import Foundation

extension LiverpoolAPIReponse {
    private struct Keys {
        static let contents = "contents"
        static let mainContent = "mainContent"
        static let itemsIndex = 3
        static let records = "records"
    }
    
    init?(JSON: AnyObject) {
        guard let contents = JSON[Keys.contents] as? [[String: Any]],
              let firstElementFromResponse = contents.first,
              let mainContent = firstElementFromResponse[Keys.mainContent] as? [Any],
              let items = mainContent[Keys.itemsIndex] as? [String: Any],
              let itemContents = items[Keys.contents] as? [[String: Any]],
              let response = itemContents.first![Keys.records] as? [AnyObject] else {
            return nil
        }
        self.items = response.flatMap({ (json) -> LiverpoolAPIResponseItem? in
            return LiverpoolAPIResponseItem(JSON: json as AnyObject)
        })
    }
}
