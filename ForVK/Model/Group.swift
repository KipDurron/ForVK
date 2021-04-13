//
//  Group.swift
//  ForVK
//
//  Created by Илья Кадыров on 20.06.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

struct Group {

    
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
        self.name = jsonDict[VKSet.name.rawValue] as? String ?? "groupName"
        self.avatarUrl = jsonDict[VKSet.avatarPhoto200.rawValue] as? String
        self.id = String(jsonDict[VKSet.id.rawValue] as? Int ?? 0)
    }
    init(cdGroup: CDGroup) {
        self.name = cdGroup.name ?? "groupName"
        self.avatarUrl = cdGroup.avatarUrl?.absoluteString ?? nil
        self.id = cdGroup.id ?? "0"
    }

    init(rGroup: RGroup) {
        self.name = rGroup.name ?? "groupName"
        self.avatarUrl = rGroup.avatarUrl
        self.id = rGroup.id ?? "0"
    }

}
