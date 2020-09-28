//
//  FriendsService.swift
//  ForVK
//
//  Created by Илья Кадыров on 28.09.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//


import Alamofire

class FriendService {
    
    func getAllFriend(idUser: Int) {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = VKWebSet.scheme.rawValue
        urlConstructor.host = VKWebSet.host.rawValue
        urlConstructor.path = VKWebSet.methodGetAllFriend.rawValue
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
                    URLQueryItem(name: "v", value: "5.124"),
                    URLQueryItem(name: "fields", value: "city,domain"),
                    URLQueryItem(name: "user_id", value: String(idUser)),
                ]
        AF.request(urlConstructor.url!).response { response in
            debugPrint(response)
        }
    }
    
}
