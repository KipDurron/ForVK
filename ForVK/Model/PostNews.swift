//
//  PostNews.swift
//  ForVK
//
//  Created by Илья Кадыров on 03.11.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit
class PostNews: News {
    var post: String?
    
    init(post: String, author: User, date: Date) {
        super.init(author: author, date: date)
        self.post = post
    }
    
    override init() {
        super.init()
    }
}
