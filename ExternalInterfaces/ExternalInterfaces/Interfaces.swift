//
//  File.swift
//  ExternalInterfaces
//
//  Created by Julio Cesar Guzman Villanueva on 11/8/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import Foundation

struct Message {
    let type: String //
    let text: String //
    let image: Data //?
}

struct Header {
    let type: String //
    let name: String //?
    let text: String //
    let image: Data //?
}

struct Footer {
    let type: String //
    let name: String //?
    let text: String //
}

struct Item {
    enum Element {
        case header
        case footer
        case sentMessage
        case receivedMessage
    }
    let type: Element
    let text: String
}

