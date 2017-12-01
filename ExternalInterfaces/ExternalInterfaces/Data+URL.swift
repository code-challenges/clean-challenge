//
//  Algo.swift
//  ExternalInterfaces
//
//  Created by Julio Cesar Guzman Villanueva on 11/10/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import Foundation

extension Data {
    static func make(with url: URL, completion: @escaping (Data?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            completion(data)
        }
        task.resume()
    }
}

