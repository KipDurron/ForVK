//
//  Group.swift
//  ForVK
//
//  Created by Илья Кадыров on 20.06.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

class Group {

    var name: String
    var avatarUrl: String?
    
    init() {
        self.name = "groupName"
        
    }
    
    init(name: String, avatarUrl: String) {
        self.name = name
        self.avatarUrl = avatarUrl
    }

}
