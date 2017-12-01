//
//  GenoiAPIResponseTests.swift
//  ExternalInterfacesTests
//
//  Created by Julio Cesar Guzman Villanueva on 11/8/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import XCTest
@testable import ExternalInterfaces

private extension JSONSerialization {
    static func makeJSONDictionary(from bundle: Bundle, with name: String) -> [String: Any]? {
        guard let JSONStateFile = bundle.path(forResource: name, ofType: "json"),
            let jsonString = try? String(contentsOfFile: JSONStateFile),
            let data = jsonString.data(using: .utf8),
            let json = try? JSONSerialization.jsonObject(with: data) else {
                XCTFail("JSON Initializing failed")
                return nil
        }
        return json as? [String: Any]
    }
}

class GenioAPIResponseTests: XCTestCase {
    
    func testAPIResponseInitialization() {
        let jsonFileName = "LiverpoolSearch"
        let bundle = Bundle(for: type(of: self))
        let jsonDictionary = JSONSerialization.makeJSONDictionary(from: bundle, with: jsonFileName)
        let parsedObject = jsonDictionary as AnyObject
        guard let response = LiverpoolAPIReponse(JSON: parsedObject) else {
            XCTFail()
            return
        }
        guard let firstElement = response.items.first else {
            XCTFail()
            return
        }
        XCTAssertTrue("Consola Xbox One X 1 TB" == firstElement.displayName)
        XCTAssertTrue("12299.0" == firstElement.salePrice)
        XCTAssertTrue("https://ss423.liverpool.com.mx/sm/1063763108.jpg" == firstElement.imageURL)
    }
}
