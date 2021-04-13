//
//  SourseData.swift
//  ForVK
//
//  Created by Илья Кадыров on 06.11.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Foundation
import SwiftyJSON
struct SourseData {
    var id: Int = 0
    var name: String = "name"
    var avatarUrl: String?
    
    init (groupJson: JSON){
        self.name = groupJson[VKSet.name.rawValue].string ?? "groupName"
        self.avatarUrl = groupJson[VKSet.avatarPhoto200.rawValue].string
        self.id = groupJson[VKSet.id.rawValue].int  ?? 0
    }
   
    init (userJson: JSON){
        let firstName = userJson[VKSet.firstName.rawValue].string
        let lastName = userJson[VKSet.lastName.rawValue].string
        self.name = (firstName ?? "firstName") + " " + (lastName ?? "lastName")
        self.avatarUrl = userJson["photo_100"].string
        self.id = userJson[VKSet.id.rawValue].int ?? 0
    }
}
