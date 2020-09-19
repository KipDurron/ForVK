//
//  UserLight.swift
//  ForVK
//
//  Created by Илья Кадыров on 19.09.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

class UserLight {

    var name: String
    var avatar: UIImage?

    
    init() {
        self.name = "userName"
        self.avatar = UIImage(systemName: "person")
    }
    
    init(name: String, avatar: UIImage?) {
        self.name = name
        self.avatar = avatar
    }
    
    static func getRandom() -> UserLight {
        return UserLight(
            name: Lorem.fullName, avatar: Lorem.avatar
        )
    }

}
