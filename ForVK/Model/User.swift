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
        let firstName = jsonDict[VKWebSet.firstName.rawValue] as? String
        let lastName = jsonDict[VKWebSet.lastName.rawValue] as? String
        self.name = (firstName ?? "firstName") + " " + (lastName ?? "lastName")
        self.avatarUrl = jsonDict[VKWebSet.avatarPhoto200.rawValue] as? String
        self.id = String(jsonDict[VKWebSet.id.rawValue] as? Int ?? 0)
    }

}
