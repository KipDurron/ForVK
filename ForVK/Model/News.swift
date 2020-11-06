//
//  News.swift
//  ForVK
//
//  Created by Илья Кадыров on 19.09.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

class News {

    var author: User
    var date: Date

    init() {
        self.author = User()
        self.date = Date()
    }

    init(author: User, date: Date) {
        self.author = author
        self.date = date
    }
    
    func getNewsData() {
        fatalError("Implement This method in subClass")
    }

}

