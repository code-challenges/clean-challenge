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
        static let salePrice = "sku.sale_Price"
        static let imageURL = "sku.smallImage"
    }
    
    init?(JSON: AnyObject) {
        guard let attributes = JSON[Keys.attributes] as? [String: Any],
              let displayNames = attributes[Keys.displayName] as? [String],
              let displayName = displayNames.first,
              let salePrices = attributes[Keys.salePrice] as? [String],
              let salePrice = salePrices.first,
              let imageURLs = attributes[Keys.imageURL] as? [String],
              let imageURL = imageURLs.first else {
                return nil
        }
        self.displayName = displayName
        self.salePrice = salePrice
        self.imageURL = imageURL
    }
}
