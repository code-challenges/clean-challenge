//
//  GenioAPI.swift
//  ExternalInterfaces
//
//  Created by Julio Cesar Guzman Villanueva on 11/10/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import Foundation

extension URLSession {
    func itemsTask(with url: URL, completion: @escaping ([Item]) -> ()) -> URLSessionDataTask {
        let task = dataTask(with: url) { (data, response, error) in
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: []),
                  let response = GenioAPIResponse(JSON: json as AnyObject) else {
                    completion([])
                    return
            }
            completion(response.items)
        }
        return task
    }
}
