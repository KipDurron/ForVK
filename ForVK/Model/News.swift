//
//  News.swift
//  ForVK
//
//  Created by Илья Кадыров on 19.09.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

class News {

    var sourseData: SourseData?
    var date: Date
    let sourseId: Int
    let type: String
    init() {
        self.date = Date()
        self.sourseId = 0
        self.type = ""
    }

    
    init(date: Date, sourseId: Int, type: String) {
        self.date = date
        self.sourseId = sourseId
        self.type = type
    }
    
    func getNewsData() {
        fatalError("Implement This method in subClass")
    }

}

