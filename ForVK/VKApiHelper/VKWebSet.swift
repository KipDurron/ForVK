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
    case methodGetPhotoUser = "/method/photos.getAll"
    case methodGetGroupUser = "/method/groups.get"
    case methodSearchGroup = "/method/groups.search"
    case firstName = "first_name"
    case lastName = "last_name"
    case avatarPhoto200 = "photo_200"
    case id = "id"
    case name = "name"
}
