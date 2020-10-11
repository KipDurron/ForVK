//
//  Photo.swift
//  ForVK
//
//  Created by Илья Кадыров on 06.10.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Foundation

class Photo {
    var url: String?
    var countLike: Int = 0
    var id: String = "0"
    
    init(jsonDict: [String: Any]) {
        let sizes = jsonDict["sizes"] as! [[String: Any]]
        for size in sizes {
            if size["type"] as! String == "q" {
                let urlStr = size["url"] as? String
                if urlStr != nil {
                    self.url = urlStr!
                }
                break
            }
        }
        let infoLike = jsonDict[VKSet.likes.rawValue] as! [String: Any]
        self.countLike = infoLike[VKSet.count.rawValue] as? Int ?? 0
        self.id = String(jsonDict[VKSet.id.rawValue] as? Int ?? 0)
    }
    
    init(cdPhoto: CDPhoto) {
        self.url = cdPhoto.url?.absoluteString ?? nil
        self.countLike = Int(cdPhoto.countLike)
        self.id = cdPhoto.id
    }

    init(rPhoto: RPhoto) {
        self.url = rPhoto.url ?? nil
        self.countLike = rPhoto.countLike
        self.id = rPhoto.id
    }
}
