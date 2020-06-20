//
//  User.swift
//  ForVK
//
//  Created by Илья Кадыров on 20.06.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

class User {

    var name: String
    var avatar: UIImage?
    var photos: [UIImage?]
    
    init() {
        self.name = "userName"
        self.avatar = UIImage(systemName: "person")
        self.photos = []
    }
    
    init(name: String, avatar: UIImage?, photos: [UIImage?]) {
        self.name = name
        self.avatar = avatar
        self.photos = photos
    }

}
