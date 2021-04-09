//
//  PostNews.swift
//  ForVK
//
//  Created by Илья Кадыров on 03.11.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit
import SwiftyJSON
class PostNews: News {
    var post: String?
    
    init(post: String, sourseId: Int, date: Date, type: String) {
        super.init(date: date, sourseId: sourseId, type: type)
        self.post = post
    }
    
    init(newsJson: JSON) {
        let type = newsJson["type"].string ?? ""
        let sourseId = newsJson["source_id"].int ?? 0
        let date = newsJson["date"].double ?? 0.0
        super.init(date: Date(timeIntervalSince1970: date), sourseId: sourseId, type: type)
        self.post = newsJson["text"].string
    }
    
    override init() {
        super.init()
    }
}
