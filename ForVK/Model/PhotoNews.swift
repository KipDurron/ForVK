//
//  PhotoNews.swift
//  ForVK
//
//  Created by Илья Кадыров on 03.11.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//
import SwiftyJSON
import UIKit
class PhotoNews: News {
    var photoUrl: String?
    
    init(photoUrl:String, sourseId: Int, date: Date, type: String) {
        super.init(date: date, sourseId: sourseId, type: type)
        self.photoUrl = photoUrl
    }
    
    init(newsJson: JSON) {
        let type = newsJson["type"].string ?? ""
        let sourseId = newsJson["source_id"].int ?? 0
        let date = newsJson["date"].double ?? 0.0
        super.init(date: Date(timeIntervalSince1970: date), sourseId: sourseId, type: type)
        for size:JSON in  newsJson["photos"]["items"][0]["sizes"].arrayValue {
            if size["type"].string! == "r" {
                self.photoUrl = size["url"].string
            }
        }
       
    }
    
    override init() {
        super.init()
    }
}
