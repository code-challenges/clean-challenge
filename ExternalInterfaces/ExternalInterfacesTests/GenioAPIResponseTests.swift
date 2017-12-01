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
        guard let response = GenioAPIResponse(JSON: parsedObject) else {
            XCTFail()
            return
        }
        guard let firstElement = response.items.first else {
            XCTFail()
            return
        }
        XCTAssert(firstElement.type == "header")
        XCTAssert(firstElement.name == "Sample Header")
        XCTAssert(firstElement.text == "Header")
        XCTAssert(firstElement.imageURL == "https://s3-us-west-2.amazonaws.com/genio.images/!3pfnNgNaorfJRI1DQzuSOrOYepkKcqQh6VHBg7jTr_G90lp3ytW3WOHxx!s2Rn0.png")
    }
}
