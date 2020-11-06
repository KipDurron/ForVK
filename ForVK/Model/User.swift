//
//  UserLight.swift
//  ForVK
//
//  Created by Илья Кадыров on 19.09.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Foundation
import UIKit

class User{

    var name: String
    var avatarUrl: String?
    var id: String = "0"

    
    init() {
        self.name = "firstName lastName"
    }
    
    init(name: String, avatarUrl: String?) {
        self.name = name
        self.avatarUrl = avatarUrl
    }
    
    init(jsonDict: [String: Any]) {
        let firstName = jsonDict[VKSet.firstName.rawValue] as? String
        let lastName = jsonDict[VKSet.lastName.rawValue] as? String
        self.name = (firstName ?? "firstName") + " " + (lastName ?? "lastName")
        self.avatarUrl = jsonDict[VKSet.avatarPhoto200.rawValue] as? String
        self.id = String(jsonDict[VKSet.id.rawValue] as? Int ?? 0)
    }
    
//    init(jsonSource: JSON) {
//        let firstName = jsonSource[VKSet.firstName.rawValue].string
//        let lastName = jsonSource[VKSet.lastName.rawValue].string
//        self.name = (firstName ?? "firstName") + " " + (lastName ?? "lastName")
//        self.avatarUrl = jsonSource[VKSet.avatarPhoto200.rawValue].string
//        self.id = String(jsonSource[VKSet.id.rawValue].int ?? 0)
//    }
    
    init(cdUser: CDUser) {
        self.name = cdUser.name ?? "firstName lastName"
        self.avatarUrl = cdUser.avatarUrl?.absoluteString ?? nil
        self.id = cdUser.id ?? "0"
    }

    init(rUser: RUser) {
        self.name = rUser.name ?? "firstName lastName"
        self.avatarUrl = rUser.avatarUrl
        self.id = rUser.id ?? "0"
    }
}
