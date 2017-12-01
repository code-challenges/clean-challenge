//
//  Notes.swift
//  ExternalInterfaces
//
//  Created by Julio Cesar Guzman Villanueva on 11/10/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import Foundation

//URL -> Data => GenioAPIResponseItem -> Message or Footer or Header
//Data -> UIImage => Message or Footer or Header -> Views

import EnterpriseBusinessRules //Gotta check this dependency

enum Keys: String {
    case leftMessage = "data_1"
    case rightMessage = "data_0"
    case header = "header"
    case footer = "footer"
}

protocol Entity {
    static func make(for item: GenioAPIResponseItem) -> Self
}

extension MessageState: Entity {
    static func make(for item: GenioAPIResponseItem) -> MessageState {
//        let mockedMessage =
//        return MessageState.received(mockedMessage)
    }
}

func entity(for item: GenioAPIResponseItem) -> Entity? {
    if item.type == Keys.leftMessage.rawValue { return MessageState.make(for: item) }
//    if item.type == Keys.rightMessage.rawValue {  return MessageState.received(mockedMessage) }
//    if item.type == Keys.header.rawValue { return Header() }
//    if item.type == Keys.footer.rawValue { return  }
}
