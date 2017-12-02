//
//  URL.swift
//  ExternalInterfaces
//
//  Created by Julio Cesar Guzman Villanueva on 11/10/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import Foundation

public extension URL {
    static func liverpoolSearch(with string: String) -> URL {
        let search = "https://www.liverpool.com.mx/tienda?s=" + string.removingWhitespaces() + "&d3106047a194921c01969dfdec083925=json"
        return URL(string: search)!
    }
}

extension String {
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}
