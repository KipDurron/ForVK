//
//  GroupService.swift
//  ForVK
//
//  Created by Илья Кадыров on 28.09.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Alamofire

class GroupService {
    
    func getGroupUser(idUser: String, completion: @escaping ([Group]) -> Void) {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = VKWebSet.scheme.rawValue
        urlConstructor.host = VKWebSet.host.rawValue
        urlConstructor.path = VKWebSet.methodGetGroupUser.rawValue
        urlConstructor.queryItems = [
                    URLQueryItem(name: "access_token", value: Session.instance.token),
                    URLQueryItem(name: "v", value: "5.124"),
                    URLQueryItem(name: "extended", value: "1"),
                    URLQueryItem(name: "user_id", value: idUser)
                ]
        
        AF.request(urlConstructor.url!).responseJSON { response in
                guard let data = response.value else { return }
                let items = VKParsingHelper.getItems(data: data)
                completion(self.parsingAllGroups(items: items))
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
    
    func parsingAllGroups(items: [[String: Any]]) -> [Group]{
        var groupArr: [Group] = []
        items.forEach({ group in
            groupArr.append(Group(jsonDict: group))
        })
        return groupArr
    }
}
