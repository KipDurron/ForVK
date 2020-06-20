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
    var avatar: UIImage?
    
    init() {
        self.name = "groupName"
        self.avatar = UIImage(systemName: "person.3")
    }
    
    init(name: String, avatar: UIImage?) {
        self.name = name
        self.avatar = avatar
    }

}
