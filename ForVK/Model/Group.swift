//
//  Group.swift
//  ForVK
//
//  Created by Илья Кадыров on 20.06.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

class Group {

    var id: String
    var name: String
    var avatarUrl: String?
    
    init() {
        self.name = "groupName"
        self.id = "0"
        
    }
    
    init(name: String, avatarUrl: String, id: String) {
        self.name = name
        self.avatarUrl = avatarUrl
        self.id = id
    }
    
    init(jsonDict: [String: Any]) {
        self.name = jsonDict[VKWebSet.name.rawValue] as? String ?? "groupName"
        self.avatarUrl = jsonDict[VKWebSet.avatarPhoto200.rawValue] as? String
        self.id = String(jsonDict[VKWebSet.id.rawValue] as? Int ?? 0)
    }

}
