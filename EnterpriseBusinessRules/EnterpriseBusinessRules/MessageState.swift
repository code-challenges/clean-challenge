//
//  MessageState.swift
//  EnterpriseBusinessRules
//
//  Created by Julio Cesar Guzman Villanueva on 11/8/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import Foundation

public enum MessageState {
    case sent(Message)
    case received(Message)
}
