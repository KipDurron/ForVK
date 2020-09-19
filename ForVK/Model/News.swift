//
//  News.swift
//  ForVK
//
//  Created by Илья Кадыров on 19.09.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

class News {

    var author: UserLight
    var date: Date
    var text: String
    var img: UIImage?

    init() {
        self.author = UserLight()
        self.date = Date()
        self.text = "Empty"
        self.img = UIImage(systemName: "list.number")
    }

    init(author: UserLight, date: Date, text: String, img: UIImage?) {
        self.author = author
        self.date = date
        self.text = text
        self.img = img
    }
    
    static func getRandom() -> News {
        return News(
            author: UserLight.getRandom(),
            date: Date(),
            text: Lorem.sentences(5),
            img: Lorem.img
        )
    }

}

