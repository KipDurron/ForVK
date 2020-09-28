//
//  GroupService.swift
//  ForVK
//
//  Created by Илья Кадыров on 28.09.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Alamofire

class GroupService {
    
    func getGroupUser(idUser: Int) {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = VKWebSet.scheme.rawValue
        urlConstructor.host = VKWebSet.host.rawValue
        urlConstructor.path = VKWebSet.methodGetGroupUser.rawValue
        urlConstructor.queryItems = [
                    URLQueryItem(name: "access_token", value: Session.instance.token),
                    URLQueryItem(name: "v", value: "5.124"),
                    URLQueryItem(name: "extended", value: "1"),
                    URLQueryItem(name: "user_id", value: String(idUser))
                ]
        
        AF.request(urlConstructor.url!).response { response in
            debugPrint(response)
        }
    }
    
    func searchGroup(text: String) {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = VKWebSet.scheme.rawValue
        urlConstructor.host = VKWebSet.host.rawValue
        urlConstructor.path = VKWebSet.methodSearchGroup.rawValue
        urlConstructor.queryItems = [
                    URLQueryItem(name: "access_token", value: Session.instance.token),
                    URLQueryItem(name: "v", value: "5.124"),
                    URLQueryItem(name: "q", value: text),
                    URLQueryItem(name: "type", value: "group"),
                ]
        
        AF.request(urlConstructor.url!).response { response in
            debugPrint(response)
        }
    }
}
