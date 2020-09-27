//
//  VKWebSet.swift
//  ForVK
//
//  Created by Илья Кадыров on 27.09.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Foundation

//enum VKWebSet: Character {
//
//    case scheme = "http"
//}

enum VKWebSet: String {
    case scheme = "https"
    case host = "api.vk.com"
    case methodGetAllFriend = "/method/friends.get"
    case methodGetPhotoUser = "/method/photos.get"
    case methodGetGroupUser = "/method/groups.get"
    case methodSearchGroup = "/method/groups.search"
    
}
