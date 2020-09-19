//
//  User.swift
//  ForVK
//
//  Created by Илья Кадыров on 20.06.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

class User: UserLight{

    var photos: [UIImage?]
    
    override init() {
        self.photos = []
        super.init()
    }
    
    init(name: String, avatar: UIImage?, photos: [UIImage?]) {
        self.photos = photos
        super.init(name: name, avatar: avatar)
    }

}
