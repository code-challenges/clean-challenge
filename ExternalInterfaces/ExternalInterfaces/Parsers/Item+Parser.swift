//
//  Item+Parser.swift
//  ExternalInterfaces
//
//  Created by Julio Cesar Guzman Villanueva on 11/10/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import Foundation

extension LiverpoolAPIResponseItem {
    private struct Keys {
        static let attributes = "attributes"
        static let displayName = "product.displayName"
    }
    
    init?(JSON: AnyObject) {
        guard let attributes = JSON[Keys.attributes] as? [String: Any],
              let displayNames = attributes[Keys.displayName] as? [String],
              let displayName = displayNames.first else {
                return nil
        }
        self.displayName = displayName
    }
}
