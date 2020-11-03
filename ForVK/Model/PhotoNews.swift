//
//  PhotoNews.swift
//  ForVK
//
//  Created by Илья Кадыров on 03.11.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit
class PhotoNews: News {
    var photo: UIImage?
    
    init(photo: UIImage, author: User, date: Date) {
        super.init(author: author, date: date)
        self.photo = photo
    }
    
    override init() {
        super.init()
        self.photo = UIImage(systemName: "list.number")
    }
}
