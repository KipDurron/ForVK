//
//  FriendsService.swift
//  ForVK
//
//  Created by Илья Кадыров on 28.09.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//


import Alamofire

class FriendService {
    
    func loadAllFriendData(idUser: String, completion: @escaping ([User]) -> Void) {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = VKWebSet.scheme.rawValue
        urlConstructor.host = VKWebSet.host.rawValue
        urlConstructor.path = VKWebSet.methodGetAllFriend.rawValue
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
                    URLQueryItem(name: "v", value: "5.124"),
                    URLQueryItem(name: "fields", value: "nicknam,photo_200"),
                    URLQueryItem(name: "user_id", value: idUser),
                ]
        AF.request(urlConstructor.url!).responseJSON{ response in
            guard let data = response.value else { return }
            let items = VKParsingHelper.getItems(data: data)
            completion(self.parsingFriend(items: items))
        }
        
    }
    
    func parsingFriend(items: [[String: Any]]) -> [User] {
        
        var userArr: [User] = []
        items.forEach({ userJsonDict in
            userArr.append(User(jsonDict: userJsonDict))
        })
        return userArr
    }
    
}
